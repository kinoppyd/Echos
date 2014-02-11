package Echos::Ws;
use Mojo::Base 'Mojolicious::Controller';

sub broadcast {
    my $self = shift;

    my $id = sprintf "%s", $self->tx;
    $self->ws->put($id, $self->tx);
    Mojo::IOLoop->stream($self->tx->connection)->timeout(300);
    say STDERR $self->tx;

    $self->on(message => sub {
            my ($self, $message) = @_;
            $self->ws->send_all($message);
        });

    $self->on(finished => sub{
            $self->ws->delete($id);
        }
    );
}

1;
