package lib::Model::Schema;
use DBIx::Skinny::Schema;

install_utf8_columns qw/echo/;
install_table 'echos' => schema {
    pk 'id';
    columns qw/
        id user echo created_at update_at delete_at
    /;
};
1;
