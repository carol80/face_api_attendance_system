import os
import sys
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = 'faq_key.json'

import dialogflow_v2 as dialogflow

dialogflow_session_client = dialogflow.SessionsClient()
PROJECT_ID = "onetapfaq-fupouq"

def detect_intent_from_text(text, session_id, language_code='en'):
    session = dialogflow_session_client.session_path(PROJECT_ID, session_id)
    text_input = dialogflow.types.TextInput(text=text, language_code=language_code)
    query_input = dialogflow.types.QueryInput(text=text_input)
    response = dialogflow_session_client.detect_intent(session=session, query_input=query_input)
    return response.query_result

def fetch_reply(query, session_id):
	response = detect_intent_from_text(query,session_id)
	return response.fulfillment_text

if __name__ == '__main__' :
    query=sys.argv[1]
    session_id = sys.argv[2]
    # print(query,session_id)
    mess = fetch_reply(query, session_id)
    print(mess)
