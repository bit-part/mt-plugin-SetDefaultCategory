package SetDefaultCategory::Callbacks;
use strict;
use warnings;
use MT::Placement;

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

sub cms_post_save_entry {
    my ($cb, $app, $obj, $orig_obj) = @_;

    my $blog_id = $app->blog->id;
    my $plugin = MT->component('SetDefaultCategory');
    my $conf_post_save_enable = $plugin->get_config_value('post_save_enable', 'blog:' . $blog_id) or return;
    return if ($conf_post_save_enable eq 'disable');

    my $conf_default_cats = $plugin->get_config_value('default_cats', 'blog:' . $blog_id) or return;
    my $entry_id = $obj->id;

    $conf_default_cats =~ s/\s//g;
    my @default_cats = split(',', $conf_default_cats);

    unless (my $cat = $obj->category) {
        my $first = 1;
        foreach my $cat_id (@default_cats) {
            my $place = MT::Placement->new;
            $place->blog_id($blog_id);
            $place->entry_id($entry_id);
            $place->category_id($cat_id);
            if ($first) {
                $place->is_primary(1);
            }
            else {
                $place->is_primary(0);
            }
            $place->save;
            $first = 0;
        }
    }

    return 1;
}

1;
