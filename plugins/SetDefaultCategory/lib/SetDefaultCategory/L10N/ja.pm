package SetDefaultCategory::L10N::ja;
use strict;
use base 'SetDefaultCategory::L10N::en_us';
use vars qw ( %Lexicon );

%Lexicon = (
    # config.yaml
    'bit part LLC' => 'bit part 合同会社',
    'You can set Default [_2] to [_1].' => '[_1]にデフォルト[_2]をセットするプラグイン',

    # blog_config.tmpl
    'default' => 'デフォルト',
    'The comma separated ID list of [_1] to set to default.' => '複数のデフォルト[_1]をセットする場合はカンマ区切りで入力します',
    'The [_1] in this [_2]/[_3].' => 'この[_2]/[_3]に属する[_1]',
    'Use setting Default [_1] after saving [_2]' => '[_2]を保存した後にデフォルト[_1]を設定する',
    'If you save [_1] without setting a [_2], Default [_2] is set.' => '[_2]を設定しないで[_1]を保存した場合、デフォルト[_2]が設定されます。',
);

1;
