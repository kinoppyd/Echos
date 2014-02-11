package Model::WsUsers;
use strict;
use warnings;
use utf8;
use v5.10;
use Mojo::JSON;

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

    my $json = Mojo::JSON->new->encode({ message=>$msg });
    for my $user (keys %$users){
        $users->{$user}->send($json);
    }
}

sub put {
    my ($self, $id, $tx) = @_;
    $self->{ws}->{$id} = $tx;
}

1;
