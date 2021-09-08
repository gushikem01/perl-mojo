package MyApp;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;
say 2;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get(
    '/:id/reserve' => sub ($c) {
      my $id   = $c->param('id');
      my $json = {id => $id};
      $c->render( json => $json);
    }
  );
}

1;
