package Echos;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('echo#index');
  $r->post('/echo')->to('echo#post');
  $r->websocket('/broadcast')->to('ws#broadcast');
}

1;
