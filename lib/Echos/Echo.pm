package Echos::Echo;
use Mojo::Base 'Mojolicious::Controller';
use lib::Model;

# This action will render a template
sub index {
    my $self = shift;
    my $model = lib::Model->new;

    my @recent_echos = $model->search(
        'echos',
        {},
        {limit=>20, order_by=>{created_at => 'desc'}}
    );

    $self->render(echos=>\@recent_echos);
}

sub post {
    my $self = shift;
    my $model = lib::Model->new;
    my $post = $self->req->json;

    my $res = $model->insert(
        'echos',
        {echo=>$post->{'echo'}}
    );
}

1;
