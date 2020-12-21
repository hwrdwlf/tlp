from flask import Flask, request, abort
from flask_cors import CORS
from images import Images
import json

app = Flask(__name__)
CORS(app)

@app.route('/')
def hello():
    return 'also working'

@app.route('/image/<image_id>', methods=['GET'])
def image(image_id):
    image = Images()
    if request.method == 'GET':
        data = image.get_image(int(image_id))
        app.logger.info(data)
        if not data:
            abort(404, description="Resource not found")

        response = app.response_class(response=json.dumps(data),
                                  status=200,
                                  mimetype='application/json')
        return response

@app.route('/images', methods=['GET'])
def images():
    image = Images()
    if request.method == 'GET':
        data = image.get_images()
        app.logger.info(data)
        if not data:
            abort(404, description="Resource not found")

        response = app.response_class(response=json.dumps(data),
                                  status=200,
                                  mimetype='application/json')
        return response
