package SetDefaultCategory::Callbacks;
use strict;
use warnings;

sub template_param_edit_entry {
    my ($cb, $app, $param, $tmpl) = @_;

    my $blog_id = $app->blog->id;
    my $plugin = MT->component('SetDefaultCategory');
    my $conf_default_cats = $plugin->get_config_value('default_cats', 'blog:' . $blog_id) or return;

    $conf_default_cats =~ s/\s//g;
    my @default_cats = split(',', $conf_default_cats);

    if (!$param->{category_id}) {
        $param->{category_id} = $default_cats[0];
    }
    my $length = @{$param->{selected_category_loop}};
    if ($length < 1) {
        $param->{selected_category_loop} = \@default_cats;
    }
    return 1;
}

1;
