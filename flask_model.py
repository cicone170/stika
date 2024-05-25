import json
import pandas as pd
from sklearn.preprocessing import StandardScaler, LabelEncoder
from tensorflow.keras.models import Sequential, load_model
from tensorflow.keras.layers import Dense, Dropout
import numpy as np

scaler = StandardScaler()
label_encoder = LabelEncoder()
model = load_model('/Users/mac/Downloads/disease_classification_model.h5')
symptoms_dict = {
    "Démangeaisons": "itching",
    "Éruption cutanée": "skin_rash",
    "Éruptions cutanées nodulaires": "nodal_skin_eruptions",
    "Éternuements continus": "continuous_sneezing",
    "Frissons": "shivering",
    "Frissonnement": "chills",
    "Douleur articulaire": "joint_pain",
    "Douleur abdominale": "stomach_pain",
    "Acidité": "acidity",
    "Ulcères sur la langue": "ulcers_on_tongue",
    "Atrophie musculaire": "muscle_wasting",
    "Vomissements": "vomiting",
    "Brûlure mictionnelle": "burning_micturition",
    "Taches urine": "spotting_ urination",
    "Fatigue": "fatigue",
    "Prise de poids": "weight_gain",
    "Anxiété": "anxiety",
    "Mains et pieds froids": "cold_hands_and_feets",
    "Sautes d'humeur": "mood_swings",
    "Perte de poids": "weight_loss",
    "Agitation": "restlessness",
    "Léthargie": "lethargy",
    "Plaques dans la gorge": "patches_in_throat",
    "Taux de sucre irrégulier": "irregular_sugar_level",
    "Toux": "cough",
    "Fièvre élevée": "high_fever",
    "Yeux enfoncés": "sunken_eyes",
    "Essoufflement": "breathlessness",
    "Sueurs": "sweating",
    "Déshydratation": "dehydration",
    "Indigestion": "indigestion",
    "Mal de tête": "headache",
    "Peau jaunâtre": "yellowish_skin",
    "Urine foncée": "dark_urine",
    "Nausées": "nausea",
    "Perte d'appétit": "loss_of_appetite",
    "Douleur derrière les yeux": "pain_behind_the_eyes",
    "Mal de dos": "back_pain",
    "Constipation": "constipation",
    "Douleur abdominale": "abdominal_pain",
    "Diarrhée": "diarrhoea",
    "Légère fièvre": "mild_fever",
    "Urine jaune": "yellow_urine",
    "Jaunissement des yeux": "yellowing_of_eyes",
    "Insuffisance hépatique aiguë": "acute_liver_failure",
    "Surcharge hydrique": "fluid_overload",
    "Gonflement de l'estomac": "swelling_of_stomach",
    "Ganglions lymphatiques enflés": "swelled_lymph_nodes",
    "Malaise": "malaise",
    "Vision floue et déformée": "blurred_and_distorted_vision",
    "Phlegme": "phlegm",
    "Irritation de la gorge": "throat_irritation",
    "Rougeur des yeux": "redness_of_eyes",
    "Pression sinusale": "sinus_pressure",
    "Nez coulant": "runny_nose",
    "Congestion": "congestion",
    "Douleur thoracique": "chest_pain",
    "Faiblesse des membres": "weakness_in_limbs",
    "Rythme cardiaque accéléré": "fast_heart_rate",
    "Douleur au moment des mouvements intestinaux": "pain_during_bowel_movements",
    "Douleur dans la région anale": "pain_in_anal_region",
    "Selles sanglantes": "bloody_stool",
    "Irritation dans l'anus": "irritation_in_anus",
    "Douleur au cou": "neck_pain",
    "Vertiges": "dizziness",
    "Crampes": "cramps",
    "Ecchymoses": "bruising",
    "Obésité": "obesity",
    "Jambes enflées": "swollen_legs",
    "Vaisseaux sanguins enflés": "swollen_blood_vessels",
    "Visage et yeux bouffis": "puffy_face_and_eyes",
    "Thyroïde élargie": "enlarged_thyroid",
    "Ongles cassants": "brittle_nails",
    "Extrémités enflées": "swollen_extremeties",
    "Faim excessive": "excessive_hunger",
    "Contacts extra-conjugaux": "extra_marital_contacts",
    "Lèvres sèches et fourmillements": "drying_and_tingling_lips",
    "Élocution trouble": "slurred_speech",
    "Douleur au genou": "knee_pain",
    "Douleur de l'articulation de la hanche": "hip_joint_pain",
    "Faiblesse musculaire": "muscle_weakness",
    "Cou raide": "stiff_neck",
    "Articulations enflées": "swelling_joints",
    "Raideur des mouvements": "movement_stiffness",
    "Mouvements rapides": "spinning_movements",
    "Perte d'équilibre": "loss_of_balance",
    "Instabilité": "unsteadiness",
    "Faiblesse d'un côté du corps": "weakness_of_one_body_side",
    "Perte d'odorat": "loss_of_smell",
    "Inconfort vésical": "bladder_discomfort",
    "Odeur nauséabonde de l'urine": "foul_smell_of urine",
    "Sensation continue d'uriner": "continuous_feel_of_urine",
    "Passage des gaz": "passage_of_gases",
    "Démangeaisons internes": "internal_itching",
    "Aspect toxique (typhus)": "toxic_look_(typhos)",
    "Dépression": "depression",
    "Irritabilité": "irritability",
    "Douleur musculaire": "muscle_pain",
    "Sensorium altéré": "altered_sensorium",
    "Taches rouges sur le corps": "red_spots_over_body",
    "Douleur au ventre": "belly_pain",
    "Menstruations anormales": "abnormal_menstruation",
    "Taches dyschromiques": "dischromic _patches",
    "Yeux larmoyants": "watering_from_eyes",
    "Augmentation de l'appétit": "increased_appetite",
    "Polyurie": "polyuria",
    "Antécédents familiaux": "family_history",
    "Expectorations muqueuses": "mucoid_sputum",
    "Expectorations rustyques": "rusty_sputum",
    "Manque de concentration": "lack_of_concentration",
    "Troubles visuels": "visual_disturbances",
    "Transfusion sanguine reçue": "receiving_blood_transfusion",
    "Réception d'injections non stériles": "receiving_unsterile_injections",
    "Coma": "coma",
    "Saignement de l'estomac": "stomach_bleeding",
    "Distension de l'abdomen": "distention_of_abdomen",
    "Consommation d'alcool": "history_of_alcohol_consumption",
    "Surcharge hydrique.1": "fluid_overload.1",
    "Sang dans les expectorations": "blood_in_sputum",
    "Veines proéminentes sur le mollet": "prominent_veins_on_calf",
    "Palpitations": "palpitations",
    "Douleur en marchant": "painful_walking",
    "Boutons purulents": "pus_filled_pimples",
    "Points noirs": "blackheads",
    "Cicatrices": "scurring",
    "Desquamation": "skin_peeling",
    "Poussière argentée": "silver_like_dusting",
    "Petites fosses dans les ongles": "small_dents_in_nails",
    "Ongles inflammatoires": "inflammatory_nails",
    "Ampoule": "blister",
    "Plaie rouge autour du nez": "red_sore_around_nose",
    "Croûte jaune suintante": "yellow_crust_ooze",
    "walo":"walo"
}
english_symptoms_list = list(symptoms_dict.values())
def translate_symptoms(french_symptoms, translation_dict):
    return [translation_dict[symptom] for symptom in french_symptoms if symptom in translation_dict]

# Example usage
french_symptoms_list = [
    "Fièvre élevée", "Fatigue", "Douleur abdominale", "Toux"
]



def prediction(french_list,english_symptoms_list=english_symptoms_list):
    feature_dict = {}
    for symptom in english_symptoms_list:
      feature_dict[symptom] = 0
    print(len(feature_dict))
    french_list=translate_symptoms(french_list)
    print(french_list)
    for french in french_list:
        feature_dict[french] = 1
    new_data_list = [feature_dict[feature] for feature in english_symptoms_list] 
    new_data_list = new_data_list[0:len(new_data_list)] 
    # Convert the list to a NumPy array
    new_data_array = np.array([new_data_list])

# Preprocess the input data (scaling if necessary)
    X_new_scaled = scaler.fit_transform(new_data_array)

# Make predictions  
    prediction = model.predict(X_new_scaled)    
    return prediction


def translate_symptoms(french_symptoms, translation_dict=symptoms_dict):
    return [translation_dict[symptom] for symptom in french_symptoms if symptom in translation_dict]

def mainfun(list):
    # Example usage
    french_symptoms_list = list
    model = load_model('/Users/mac/Downloads/disease_classification_model.h5')


    x = prediction(french_symptoms_list)
    return label_encoder.fit_transform(x.argmax(axis=1))


from flask import Flask, request, jsonify
from PIL import Image
import io

app = Flask(__name__)

@app.route('/upload', methods=['POST'])
def upload():
    items = request.form['items']
    items_list = json.loads(items)
    print(items_list)
    rep=mainfun(items_list)
    return jsonify({'text': rep})

if __name__ == '__main__':
    app.run(debug=True)
