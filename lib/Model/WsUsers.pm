package Model::WsUsers;
use strict;
use warnings;

our $instance;

sub new {
    $Model::WsUsers::instance = bless {ws=>{}}, shift unless $Model::WsUsers::instance;
    return $Model::WsUsers::instance;
}

sub get_all {
    my ($self) = @_;
    return $self->{ws};
}

sub send_all {
    my ($self, $msg) = @_;
    my $users = $self->{'ws'};
    for my $user (keys %$users){
        $users->{$user}->send(
            Mojo::JSON->new->encode({
                    message=>$msg
                })
        );
    }
}

sub put {
    my ($self, $id, $tx) = @_;
    $self->{ws}->{$id} = $tx;
}

1;
