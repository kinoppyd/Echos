package Echos::Ws;
use Mojo::Base 'Mojolicious::Controller';

my $clients ={};

sub broadcast {
    my $self = shift;

    my $id = sprintf "%s", $self->tx;
    $clients->{$id} = $self->tx;
    say STDERR $self->tx;

    $self->on(message => sub {
            my ($self, $message) = @_;
            send_all($message);
        });

    $self->on(finished => sub{
            delete $clients->{$id};
        }
    );
}

sub send_all {
    my ($message) = @_;
    for my $usr (keys %$clients){
        $clients->{$usr}->send(
            Mojo::JSON->new->encode({
                    message=>$message
                })
        );
    }
}
1;
