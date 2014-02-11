package lib::Model;

use DBIx::Skinny connect_info => +{
    dsn => 'dbi:mysql:echos',
    username => '',
    password => '',
};

1;
