def initialize_routes(api):
    from app.routes.example_route import ExampleResource
    api.add_resource(ExampleResource, '/example')
