from flask_restful import Resource

class ExampleResource(Resource):
    def get(self):
        return {'message': 'Hello, world!'}
