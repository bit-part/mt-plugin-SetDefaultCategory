package SetDefaultCategory::L10N::ja;
use strict;
use base 'SetDefaultCategory::L10N::en_us';
use vars qw ( %Lexicon );

%Lexicon = (
  # config.yaml
	'bit part LLC' => 'bit part 合同会社',
  'You can set default [_2] to [_1].' => '[_1]にデフォルト[_2]をセットするプラグイン',

  # blog_config.tmpl
  'default' => 'デフォルト',
  'The comma separated ID list of categories to set to default.' => '複数のデフォルトカテゴリをセットする場合はカンマ区切りで入力します',
  'The [_1] in this [_2]/[_3].' => 'この[_2]/[_3]に属する[_1]',
);

1;
