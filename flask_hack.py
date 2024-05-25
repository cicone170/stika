import cv2 as cv
import numpy as np
from imutils.perspective import four_point_transform
import pytesseract
import base64
from PIL import Image
import io
import re
from flask import Flask, request, jsonify

app = Flask(__name__)

document_contour = None

def scan_detection(image):
    global document_contour
    WIDTH, HEIGHT, CHANNEL = image.shape
    document_contour = np.array([[0, 0], [WIDTH, 0], [WIDTH, HEIGHT], [0, HEIGHT]])
 
    gray = cv.cvtColor(image, cv.COLOR_BGR2GRAY)
    blur = cv.GaussianBlur(gray, (5, 5), 0)
    _, threshold = cv.threshold(blur, 50, 255, cv.THRESH_BINARY + cv.THRESH_OTSU)
 
    contours, _ = cv.findContours(threshold, cv.RETR_LIST, cv.CHAIN_APPROX_SIMPLE)
    contours = sorted(contours, key=cv.contourArea, reverse=True)
 
    max_area = 0
    for contour in contours:
        area = cv.contourArea(contour)
        if area > 1000:
            peri = cv.arcLength(contour, True)
            approx = cv.approxPolyDP(contour, 0.015 * peri, True)
            if area > max_area and len(approx) == 4:
                document_contour = approx
                max_area = area
 
    cv.drawContours(image, [document_contour], -1, (0, 255, 0), 3)
 

def image_processing(image):
    gray = cv.cvtColor(image, cv.COLOR_BGR2GRAY)
    _, threshold = cv.threshold(gray, 80, 255, cv.THRESH_BINARY)
    return threshold

def extract_information(text):
    id_pattern = re.compile(r'\b\d{18}\b')
    blood_type_pattern = re.compile(r'\s*([ABO]{1,2}[+-])')
    dob_pattern = re.compile(r'\b\d{2}\.\d{2}\.\d{4}\b')

    id_match = id_pattern.search(text)
    blood_type_matches = blood_type_pattern.findall(text)
    dob_matches = dob_pattern.findall(text)

    id_number = id_match.group() if id_match else ''
    blood_type = blood_type_matches[-1] if blood_type_matches else ''
    dob = dob_matches[-1] if dob_matches else ''

    return (id_number, blood_type, dob)

def main(img):
    scan_detection(img)
    warped = four_point_transform(img, document_contour.reshape(4, 2))
    processed = image_processing(warped)
    ocr_text = pytesseract.image_to_string(processed)
    info = extract_information(ocr_text)
    return info

@app.route('/upload', methods=['POST'])
def upload():
    file = request.files['image']
    image = Image.open(io.BytesIO(file.read()))
    img_np = np.array(image)
    response = main(img_np)
    return jsonify({'id': response[0], 'date': response[2].replace(".", "/")})

if __name__ == '__main__':
    app.run(debug=True)

