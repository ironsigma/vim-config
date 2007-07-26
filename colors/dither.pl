#!/usr/bin/perl
use strict;
use warnings;

my %color_names_table = ( # {{{
    'aliceblue'            => {RGB => 'f0f8ff', C => 195},
    'antiquewhite'         => {RGB => 'faebd7', C => 230},
    'antiquewhite1'        => {RGB => 'ffefdb', C => 230},
    'antiquewhite2'        => {RGB => 'eedfcc', C => 180},
    'antiquewhite3'        => {RGB => 'cdc0b0', C => 187},
    'antiquewhite4'        => {RGB => '8b8378', C => 8},
    'aquamarine'           => {RGB => '7fffd4', C => 122},
    'aquamarine1'          => {RGB => '7fffd4', C => 122},
    'aquamarine2'          => {RGB => '76eec6', C => 79},
    'aquamarine3'          => {RGB => '66cdaa', C => 115},
    'aquamarine4'          => {RGB => '458b74', C => 72},
    'azure'                => {RGB => 'f0ffff', C => 195},
    'azure1'               => {RGB => 'f0ffff', C => 195},
    'azure2'               => {RGB => 'e0eeee', C => 152},
    'azure3'               => {RGB => 'c1cdcd', C => 109},
    'azure4'               => {RGB => '838b8b', C => 66},
    'beige'                => {RGB => 'f5f5dc', C => 186},
    'bisque'               => {RGB => 'ffe4c4', C => 223},
    'bisque1'              => {RGB => 'ffe4c4', C => 223},
    'bisque2'              => {RGB => 'eed5b7', C => 180},
    'bisque3'              => {RGB => 'cdb79e', C => 187},
    'bisque4'              => {RGB => '8b7d6b', C => 101},
    'black'                => {RGB => '000000', C => 0},
    'blanchedalmond'       => {RGB => 'ffebcd', C => 230},
    'blue'                 => {RGB => '0000ff', C => 21},
    'blue1'                => {RGB => '0000ff', C => 21},
    'blue2'                => {RGB => '0000ee', C => 21},
    'blue3'                => {RGB => '0000cd', C => 4},
    'blue4'                => {RGB => '00008b', C => 18},
    'blueviolet'           => {RGB => '8a2be2', C => 5},
    'brown'                => {RGB => 'a52a2a', C => 167},
    'brown1'               => {RGB => 'ff4040', C => 203},
    'brown2'               => {RGB => 'ee3b3b', C => 196},
    'brown3'               => {RGB => 'cd3333', C => 167},
    'brown4'               => {RGB => '8b2323', C => 167},
    'burlywood'            => {RGB => 'deb887', C => 180},
    'burlywood1'           => {RGB => 'ffd39b', C => 222},
    'burlywood2'           => {RGB => 'eec591', C => 179},
    'burlywood3'           => {RGB => 'cdaa7d', C => 180},
    'burlywood4'           => {RGB => '8b7355', C => 101},
    'cadetblue'            => {RGB => '5f9ea0', C => 73},
    'cadetblue1'           => {RGB => '98f5ff', C => 123},
    'cadetblue2'           => {RGB => '8ee5ee', C => 80},
    'cadetblue3'           => {RGB => '7ac5cd', C => 116},
    'cadetblue4'           => {RGB => '53868b', C => 66},
    'chartreuse'           => {RGB => '7fff00', C => 118},
    'chartreuse1'          => {RGB => '7fff00', C => 118},
    'chartreuse2'          => {RGB => '76ee00', C => 118},
    'chartreuse3'          => {RGB => '66cd00', C => 76},
    'chartreuse4'          => {RGB => '458b00', C => 64},
    'chocolate'            => {RGB => 'd2691e', C => 173},
    'chocolate1'           => {RGB => 'ff7f24', C => 202},
    'chocolate2'           => {RGB => 'ee7621', C => 202},
    'chocolate3'           => {RGB => 'cd661d', C => 173},
    'chocolate4'           => {RGB => '8b4513', C => 130},
    'coral'                => {RGB => 'ff7f50', C => 209},
    'coral1'               => {RGB => 'ff7256', C => 209},
    'coral2'               => {RGB => 'ee6a50', C => 209},
    'coral3'               => {RGB => 'cd5b45', C => 167},
    'coral4'               => {RGB => '8b3e2f', C => 131},
    'cornflowerblue'       => {RGB => '6495ed', C => 68},
    'cornsilk'             => {RGB => 'fff8dc', C => 230},
    'cornsilk1'            => {RGB => 'fff8dc', C => 230},
    'cornsilk2'            => {RGB => 'eee8cd', C => 186},
    'cornsilk3'            => {RGB => 'cdc8b1', C => 187},
    'cornsilk4'            => {RGB => '8b8878', C => 8},
    'cyan'                 => {RGB => '00ffff', C => 51},
    'cyan1'                => {RGB => '00ffff', C => 51},
    'cyan2'                => {RGB => '00eeee', C => 51},
    'cyan3'                => {RGB => '00cdcd', C => 6},
    'cyan4'                => {RGB => '008b8b', C => 30},
    'darkblue'             => {RGB => '00008b', C => 18},
    'darkcyan'             => {RGB => '008b8b', C => 30},
    'darkgoldenrod'        => {RGB => 'b8860b', C => 3},
    'darkgoldenrod1'       => {RGB => 'ffb90f', C => 214},
    'darkgoldenrod2'       => {RGB => 'eead0e', C => 214},
    'darkgoldenrod3'       => {RGB => 'cd950c', C => 172},
    'darkgoldenrod4'       => {RGB => '8b6508', C => 94},
    'darkgray'             => {RGB => 'a9a9a9', C => 248},
    'darkgreen'            => {RGB => '006400', C => 22},
    'darkgrey'             => {RGB => 'a9a9a9', C => 248},
    'darkkhaki'            => {RGB => 'bdb76b', C => 143},
    'darkmagenta'          => {RGB => '8b008b', C => 90},
    'darkolivegreen'       => {RGB => '556b2f', C => 107},
    'darkolivegreen1'      => {RGB => 'caff70', C => 191},
    'darkolivegreen2'      => {RGB => 'bcee68', C => 191},
    'darkolivegreen3'      => {RGB => 'a2cd5a', C => 149},
    'darkolivegreen4'      => {RGB => '6e8b3d', C => 107},
    'darkorange'           => {RGB => 'ff8c00', C => 208},
    'darkorange1'          => {RGB => 'ff7f00', C => 208},
    'darkorange2'          => {RGB => 'ee7600', C => 208},
    'darkorange3'          => {RGB => 'cd6600', C => 166},
    'darkorange4'          => {RGB => '8b4500', C => 94},
    'darkorchid'           => {RGB => '9932cc', C => 134},
    'darkorchid1'          => {RGB => 'bf3eff', C => 13},
    'darkorchid2'          => {RGB => 'b23aee', C => 13},
    'darkorchid3'          => {RGB => '9a32cd', C => 134},
    'darkorchid4'          => {RGB => '68228b', C => 5},
    'darkred'              => {RGB => '8b0000', C => 88},
    'darksalmon'           => {RGB => 'e9967a', C => 173},
    'darkseagreen'         => {RGB => '8fbc8f', C => 108},
    'darkseagreen1'        => {RGB => 'c1ffc1', C => 157},
    'darkseagreen2'        => {RGB => 'b4eeb4', C => 114},
    'darkseagreen3'        => {RGB => '9bcd9b', C => 151},
    'darkseagreen4'        => {RGB => '698b69', C => 65},
    'darkslateblue'        => {RGB => '483d8b', C => 61},
    'darkslategray'        => {RGB => '2f4f4f', C => 66},
    'darkslategray1'       => {RGB => '97ffff', C => 123},
    'darkslategray2'       => {RGB => '8deeee', C => 80},
    'darkslategray3'       => {RGB => '79cdcd', C => 116},
    'darkslategray4'       => {RGB => '528b8b', C => 66},
    'darkslategrey'        => {RGB => '2f4f4f', C => 66},
    'darkturquoise'        => {RGB => '00ced1', C => 6},
    'darkviolet'           => {RGB => '9400d3', C => 92},
    'deeppink'             => {RGB => 'ff1493', C => 198},
    'deeppink1'            => {RGB => 'ff1493', C => 198},
    'deeppink2'            => {RGB => 'ee1289', C => 198},
    'deeppink3'            => {RGB => 'cd1076', C => 5},
    'deeppink4'            => {RGB => '8b0a50', C => 89},
    'deepskyblue'          => {RGB => '00bfff', C => 39},
    'deepskyblue1'         => {RGB => '00bfff', C => 39},
    'deepskyblue2'         => {RGB => '00b2ee', C => 39},
    'deepskyblue3'         => {RGB => '009acd', C => 6},
    'deepskyblue4'         => {RGB => '00688b', C => 24},
    'dimgray'              => {RGB => '696969', C => 242},
    'dimgrey'              => {RGB => '696969', C => 242},
    'dodgerblue'           => {RGB => '1e90ff', C => 33},
    'dodgerblue1'          => {RGB => '1e90ff', C => 33},
    'dodgerblue2'          => {RGB => '1c86ee', C => 33},
    'dodgerblue3'          => {RGB => '1874cd', C => 5},
    'dodgerblue4'          => {RGB => '104e8b', C => 5},
    'firebrick'            => {RGB => 'b22222', C => 167},
    'firebrick1'           => {RGB => 'ff3030', C => 203},
    'firebrick2'           => {RGB => 'ee2c2c', C => 196},
    'firebrick3'           => {RGB => 'cd2626', C => 167},
    'firebrick4'           => {RGB => '8b1a1a', C => 167},
    'floralwhite'          => {RGB => 'fffaf0', C => 230},
    'forestgreen'          => {RGB => '228b22', C => 5},
    'gainsboro'            => {RGB => 'dcdcdc', C => 253},
    'ghostwhite'           => {RGB => 'f8f8ff', C => 189},
    'gold'                 => {RGB => 'ffd700', C => 220},
    'gold1'                => {RGB => 'ffd700', C => 220},
    'gold2'                => {RGB => 'eec900', C => 220},
    'gold3'                => {RGB => 'cdad00', C => 3},
    'gold4'                => {RGB => '8b7500', C => 94},
    'goldenrod'            => {RGB => 'daa520', C => 179},
    'goldenrod1'           => {RGB => 'ffc125', C => 214},
    'goldenrod2'           => {RGB => 'eeb422', C => 214},
    'goldenrod3'           => {RGB => 'cd9b1d', C => 179},
    'goldenrod4'           => {RGB => '8b6914', C => 136},
    'gray'                 => {RGB => 'bebebe', C => 250},
    'gray0'                => {RGB => '000000', C => 0},
    'gray1'                => {RGB => '030303', C => 0},
    'gray10'               => {RGB => '1a1a1a', C => 234},
    'gray100'              => {RGB => 'ffffff', C => 15},
    'gray11'               => {RGB => '1c1c1c', C => 234},
    'gray12'               => {RGB => '1f1f1f', C => 234},
    'gray13'               => {RGB => '212121', C => 234},
    'gray14'               => {RGB => '242424', C => 235},
    'gray15'               => {RGB => '262626', C => 235},
    'gray16'               => {RGB => '292929', C => 235},
    'gray17'               => {RGB => '2b2b2b', C => 235},
    'gray18'               => {RGB => '2e2e2e', C => 236},
    'gray19'               => {RGB => '303030', C => 236},
    'gray2'                => {RGB => '050505', C => 232},
    'gray20'               => {RGB => '333333', C => 236},
    'gray21'               => {RGB => '363636', C => 237},
    'gray22'               => {RGB => '383838', C => 237},
    'gray23'               => {RGB => '3b3b3b', C => 237},
    'gray24'               => {RGB => '3d3d3d', C => 237},
    'gray25'               => {RGB => '404040', C => 238},
    'gray26'               => {RGB => '424242', C => 238},
    'gray27'               => {RGB => '454545', C => 238},
    'gray28'               => {RGB => '474747', C => 238},
    'gray29'               => {RGB => '4a4a4a', C => 239},
    'gray3'                => {RGB => '080808', C => 232},
    'gray30'               => {RGB => '4d4d4d', C => 239},
    'gray31'               => {RGB => '4f4f4f', C => 239},
    'gray32'               => {RGB => '525252', C => 239},
    'gray33'               => {RGB => '545454', C => 240},
    'gray34'               => {RGB => '575757', C => 240},
    'gray35'               => {RGB => '595959', C => 240},
    'gray36'               => {RGB => '5c5c5c', C => 59},
    'gray37'               => {RGB => '5e5e5e', C => 59},
    'gray38'               => {RGB => '616161', C => 241},
    'gray39'               => {RGB => '636363', C => 241},
    'gray4'                => {RGB => '0a0a0a', C => 232},
    'gray40'               => {RGB => '666666', C => 241},
    'gray41'               => {RGB => '696969', C => 242},
    'gray42'               => {RGB => '6b6b6b', C => 242},
    'gray43'               => {RGB => '6e6e6e', C => 242},
    'gray44'               => {RGB => '707070', C => 242},
    'gray45'               => {RGB => '737373', C => 243},
    'gray46'               => {RGB => '757575', C => 243},
    'gray47'               => {RGB => '787878', C => 243},
    'gray48'               => {RGB => '7a7a7a', C => 243},
    'gray49'               => {RGB => '7d7d7d', C => 8},
    'gray5'                => {RGB => '0d0d0d', C => 232},
    'gray50'               => {RGB => '7f7f7f', C => 8},
    'gray51'               => {RGB => '828282', C => 8},
    'gray52'               => {RGB => '858585', C => 102},
    'gray53'               => {RGB => '878787', C => 102},
    'gray54'               => {RGB => '8a8a8a', C => 245},
    'gray55'               => {RGB => '8c8c8c', C => 245},
    'gray56'               => {RGB => '8f8f8f', C => 245},
    'gray57'               => {RGB => '919191', C => 246},
    'gray58'               => {RGB => '949494', C => 246},
    'gray59'               => {RGB => '969696', C => 246},
    'gray6'                => {RGB => '0f0f0f', C => 233},
    'gray60'               => {RGB => '999999', C => 247},
    'gray61'               => {RGB => '9c9c9c', C => 247},
    'gray62'               => {RGB => '9e9e9e', C => 247},
    'gray63'               => {RGB => 'a1a1a1', C => 247},
    'gray64'               => {RGB => 'a3a3a3', C => 248},
    'gray65'               => {RGB => 'a6a6a6', C => 248},
    'gray66'               => {RGB => 'a8a8a8', C => 248},
    'gray67'               => {RGB => 'ababab', C => 248},
    'gray68'               => {RGB => 'adadad', C => 145},
    'gray69'               => {RGB => 'b0b0b0', C => 145},
    'gray7'                => {RGB => '121212', C => 233},
    'gray70'               => {RGB => 'b3b3b3', C => 249},
    'gray71'               => {RGB => 'b5b5b5', C => 249},
    'gray72'               => {RGB => 'b8b8b8', C => 250},
    'gray73'               => {RGB => 'bababa', C => 250},
    'gray74'               => {RGB => 'bdbdbd', C => 250},
    'gray75'               => {RGB => 'bfbfbf', C => 250},
    'gray76'               => {RGB => 'c2c2c2', C => 251},
    'gray77'               => {RGB => 'c4c4c4', C => 251},
    'gray78'               => {RGB => 'c7c7c7', C => 251},
    'gray79'               => {RGB => 'c9c9c9', C => 7},
    'gray8'                => {RGB => '141414', C => 233},
    'gray80'               => {RGB => 'cccccc', C => 7},
    'gray81'               => {RGB => 'cfcfcf', C => 252},
    'gray82'               => {RGB => 'd1d1d1', C => 252},
    'gray83'               => {RGB => 'd4d4d4', C => 188},
    'gray84'               => {RGB => 'd6d6d6', C => 188},
    'gray85'               => {RGB => 'd9d9d9', C => 253},
    'gray86'               => {RGB => 'dbdbdb', C => 253},
    'gray87'               => {RGB => 'dedede', C => 253},
    'gray88'               => {RGB => 'e0e0e0', C => 254},
    'gray89'               => {RGB => 'e3e3e3', C => 254},
    'gray9'                => {RGB => '171717', C => 234},
    'gray90'               => {RGB => 'e5e5e5', C => 254},
    'gray91'               => {RGB => 'e8e8e8', C => 254},
    'gray92'               => {RGB => 'ebebeb', C => 255},
    'gray93'               => {RGB => 'ededed', C => 255},
    'gray94'               => {RGB => 'f0f0f0', C => 255},
    'gray95'               => {RGB => 'f2f2f2', C => 255},
    'gray96'               => {RGB => 'f5f5f5', C => 255},
    'gray97'               => {RGB => 'f7f7f7', C => 15},
    'gray98'               => {RGB => 'fafafa', C => 15},
    'gray99'               => {RGB => 'fcfcfc', C => 15},
    'green'                => {RGB => '00ff00', C => 46},
    'green1'               => {RGB => '00ff00', C => 46},
    'green2'               => {RGB => '00ee00', C => 10},
    'green3'               => {RGB => '00cd00', C => 2},
    'green4'               => {RGB => '008b00', C => 28},
    'greenyellow'          => {RGB => 'adff2f', C => 118},
    'grey'                 => {RGB => 'bebebe', C => 250},
    'grey0'                => {RGB => '000000', C => 0},
    'grey1'                => {RGB => '030303', C => 0},
    'grey10'               => {RGB => '1a1a1a', C => 234},
    'grey100'              => {RGB => 'ffffff', C => 15},
    'grey11'               => {RGB => '1c1c1c', C => 234},
    'grey12'               => {RGB => '1f1f1f', C => 234},
    'grey13'               => {RGB => '212121', C => 234},
    'grey14'               => {RGB => '242424', C => 235},
    'grey15'               => {RGB => '262626', C => 235},
    'grey16'               => {RGB => '292929', C => 235},
    'grey17'               => {RGB => '2b2b2b', C => 235},
    'grey18'               => {RGB => '2e2e2e', C => 236},
    'grey19'               => {RGB => '303030', C => 236},
    'grey2'                => {RGB => '050505', C => 232},
    'grey20'               => {RGB => '333333', C => 236},
    'grey21'               => {RGB => '363636', C => 237},
    'grey22'               => {RGB => '383838', C => 237},
    'grey23'               => {RGB => '3b3b3b', C => 237},
    'grey24'               => {RGB => '3d3d3d', C => 237},
    'grey25'               => {RGB => '404040', C => 238},
    'grey26'               => {RGB => '424242', C => 238},
    'grey27'               => {RGB => '454545', C => 238},
    'grey28'               => {RGB => '474747', C => 238},
    'grey29'               => {RGB => '4a4a4a', C => 239},
    'grey3'                => {RGB => '080808', C => 232},
    'grey30'               => {RGB => '4d4d4d', C => 239},
    'grey31'               => {RGB => '4f4f4f', C => 239},
    'grey32'               => {RGB => '525252', C => 239},
    'grey33'               => {RGB => '545454', C => 240},
    'grey34'               => {RGB => '575757', C => 240},
    'grey35'               => {RGB => '595959', C => 240},
    'grey36'               => {RGB => '5c5c5c', C => 59},
    'grey37'               => {RGB => '5e5e5e', C => 59},
    'grey38'               => {RGB => '616161', C => 241},
    'grey39'               => {RGB => '636363', C => 241},
    'grey4'                => {RGB => '0a0a0a', C => 232},
    'grey40'               => {RGB => '666666', C => 241},
    'grey41'               => {RGB => '696969', C => 242},
    'grey42'               => {RGB => '6b6b6b', C => 242},
    'grey43'               => {RGB => '6e6e6e', C => 242},
    'grey44'               => {RGB => '707070', C => 242},
    'grey45'               => {RGB => '737373', C => 243},
    'grey46'               => {RGB => '757575', C => 243},
    'grey47'               => {RGB => '787878', C => 243},
    'grey48'               => {RGB => '7a7a7a', C => 243},
    'grey49'               => {RGB => '7d7d7d', C => 8},
    'grey5'                => {RGB => '0d0d0d', C => 232},
    'grey50'               => {RGB => '7f7f7f', C => 8},
    'grey51'               => {RGB => '828282', C => 8},
    'grey52'               => {RGB => '858585', C => 102},
    'grey53'               => {RGB => '878787', C => 102},
    'grey54'               => {RGB => '8a8a8a', C => 245},
    'grey55'               => {RGB => '8c8c8c', C => 245},
    'grey56'               => {RGB => '8f8f8f', C => 245},
    'grey57'               => {RGB => '919191', C => 246},
    'grey58'               => {RGB => '949494', C => 246},
    'grey59'               => {RGB => '969696', C => 246},
    'grey6'                => {RGB => '0f0f0f', C => 233},
    'grey60'               => {RGB => '999999', C => 247},
    'grey61'               => {RGB => '9c9c9c', C => 247},
    'grey62'               => {RGB => '9e9e9e', C => 247},
    'grey63'               => {RGB => 'a1a1a1', C => 247},
    'grey64'               => {RGB => 'a3a3a3', C => 248},
    'grey65'               => {RGB => 'a6a6a6', C => 248},
    'grey66'               => {RGB => 'a8a8a8', C => 248},
    'grey67'               => {RGB => 'ababab', C => 248},
    'grey68'               => {RGB => 'adadad', C => 145},
    'grey69'               => {RGB => 'b0b0b0', C => 145},
    'grey7'                => {RGB => '121212', C => 233},
    'grey70'               => {RGB => 'b3b3b3', C => 249},
    'grey71'               => {RGB => 'b5b5b5', C => 249},
    'grey72'               => {RGB => 'b8b8b8', C => 250},
    'grey73'               => {RGB => 'bababa', C => 250},
    'grey74'               => {RGB => 'bdbdbd', C => 250},
    'grey75'               => {RGB => 'bfbfbf', C => 250},
    'grey76'               => {RGB => 'c2c2c2', C => 251},
    'grey77'               => {RGB => 'c4c4c4', C => 251},
    'grey78'               => {RGB => 'c7c7c7', C => 251},
    'grey79'               => {RGB => 'c9c9c9', C => 7},
    'grey8'                => {RGB => '141414', C => 233},
    'grey80'               => {RGB => 'cccccc', C => 7},
    'grey81'               => {RGB => 'cfcfcf', C => 252},
    'grey82'               => {RGB => 'd1d1d1', C => 252},
    'grey83'               => {RGB => 'd4d4d4', C => 188},
    'grey84'               => {RGB => 'd6d6d6', C => 188},
    'grey85'               => {RGB => 'd9d9d9', C => 253},
    'grey86'               => {RGB => 'dbdbdb', C => 253},
    'grey87'               => {RGB => 'dedede', C => 253},
    'grey88'               => {RGB => 'e0e0e0', C => 254},
    'grey89'               => {RGB => 'e3e3e3', C => 254},
    'grey9'                => {RGB => '171717', C => 234},
    'grey90'               => {RGB => 'e5e5e5', C => 254},
    'grey91'               => {RGB => 'e8e8e8', C => 254},
    'grey92'               => {RGB => 'ebebeb', C => 255},
    'grey93'               => {RGB => 'ededed', C => 255},
    'grey94'               => {RGB => 'f0f0f0', C => 255},
    'grey95'               => {RGB => 'f2f2f2', C => 255},
    'grey96'               => {RGB => 'f5f5f5', C => 255},
    'grey97'               => {RGB => 'f7f7f7', C => 15},
    'grey98'               => {RGB => 'fafafa', C => 15},
    'grey99'               => {RGB => 'fcfcfc', C => 15},
    'honeydew'             => {RGB => 'f0fff0', C => 194},
    'honeydew1'            => {RGB => 'f0fff0', C => 194},
    'honeydew2'            => {RGB => 'e0eee0', C => 151},
    'honeydew3'            => {RGB => 'c1cdc1', C => 251},
    'honeydew4'            => {RGB => '838b83', C => 102},
    'hotpink'              => {RGB => 'ff69b4', C => 205},
    'hotpink1'             => {RGB => 'ff6eb4', C => 205},
    'hotpink2'             => {RGB => 'ee6aa7', C => 205},
    'hotpink3'             => {RGB => 'cd6090', C => 168},
    'hotpink4'             => {RGB => '8b3a62', C => 132},
    'indianred'            => {RGB => 'cd5c5c', C => 167},
    'indianred1'           => {RGB => 'ff6a6a', C => 203},
    'indianred2'           => {RGB => 'ee6363', C => 203},
    'indianred3'           => {RGB => 'cd5555', C => 167},
    'indianred4'           => {RGB => '8b3a3a', C => 131},
    'ivory'                => {RGB => 'fffff0', C => 230},
    'ivory1'               => {RGB => 'fffff0', C => 230},
    'ivory2'               => {RGB => 'eeeee0', C => 187},
    'ivory3'               => {RGB => 'cdcdc1', C => 251},
    'ivory4'               => {RGB => '8b8b83', C => 102},
    'khaki'                => {RGB => 'f0e68c', C => 185},
    'khaki1'               => {RGB => 'fff68f', C => 228},
    'khaki2'               => {RGB => 'eee685', C => 185},
    'khaki3'               => {RGB => 'cdc673', C => 186},
    'khaki4'               => {RGB => '8b864e', C => 101},
    'lavender'             => {RGB => 'e6e6fa', C => 104},
    'lavenderblush'        => {RGB => 'fff0f5', C => 225},
    'lavenderblush1'       => {RGB => 'fff0f5', C => 225},
    'lavenderblush2'       => {RGB => 'eee0e5', C => 182},
    'lavenderblush3'       => {RGB => 'cdc1c5', C => 139},
    'lavenderblush4'       => {RGB => '8b8386', C => 96},
    'lawngreen'            => {RGB => '7cfc00', C => 118},
    'lemonchiffon'         => {RGB => 'fffacd', C => 230},
    'lemonchiffon1'        => {RGB => 'fffacd', C => 230},
    'lemonchiffon2'        => {RGB => 'eee9bf', C => 186},
    'lemonchiffon3'        => {RGB => 'cdc9a5', C => 187},
    'lemonchiffon4'        => {RGB => '8b8970', C => 101},
    'lightblue'            => {RGB => 'add8e6', C => 110},
    'lightblue1'           => {RGB => 'bfefff', C => 153},
    'lightblue2'           => {RGB => 'b2dfee', C => 110},
    'lightblue3'           => {RGB => '9ac0cd', C => 152},
    'lightblue4'           => {RGB => '68838b', C => 66},
    'lightcoral'           => {RGB => 'f08080', C => 203},
    'lightcyan'            => {RGB => 'e0ffff', C => 195},
    'lightcyan1'           => {RGB => 'e0ffff', C => 195},
    'lightcyan2'           => {RGB => 'd1eeee', C => 152},
    'lightcyan3'           => {RGB => 'b4cdcd', C => 152},
    'lightcyan4'           => {RGB => '7a8b8b', C => 66},
    'lightgoldenrod'       => {RGB => 'eedd82', C => 185},
    'lightgoldenrod1'      => {RGB => 'ffec8b', C => 222},
    'lightgoldenrod2'      => {RGB => 'eedc82', C => 179},
    'lightgoldenrod3'      => {RGB => 'cdbe70', C => 186},
    'lightgoldenrod4'      => {RGB => '8b814c', C => 143},
    'lightgoldenrodyellow' => {RGB => 'fafad2', C => 230},
    'lightgray'            => {RGB => 'd3d3d3', C => 252},
    'lightgreen'           => {RGB => '90ee90', C => 77},
    'lightgrey'            => {RGB => 'd3d3d3', C => 252},
    'lightpink'            => {RGB => 'ffb6c1', C => 218},
    'lightpink1'           => {RGB => 'ffaeb9', C => 218},
    'lightpink2'           => {RGB => 'eea2ad', C => 168},
    'lightpink3'           => {RGB => 'cd8c95', C => 175},
    'lightpink4'           => {RGB => '8b5f65', C => 96},
    'lightsalmon'          => {RGB => 'ffa07a', C => 216},
    'lightsalmon1'         => {RGB => 'ffa07a', C => 216},
    'lightsalmon2'         => {RGB => 'ee9572', C => 173},
    'lightsalmon3'         => {RGB => 'cd8162', C => 173},
    'lightsalmon4'         => {RGB => '8b5742', C => 137},
    'lightseagreen'        => {RGB => '20b2aa', C => 5},
    'lightskyblue'         => {RGB => '87cefa', C => 117},
    'lightskyblue1'        => {RGB => 'b0e2ff', C => 153},
    'lightskyblue2'        => {RGB => 'a4d3ee', C => 74},
    'lightskyblue3'        => {RGB => '8db6cd', C => 152},
    'lightskyblue4'        => {RGB => '607b8b', C => 66},
    'lightslateblue'       => {RGB => '8470ff', C => 99},
    'lightslategray'       => {RGB => '778899', C => 60},
    'lightslategrey'       => {RGB => '778899', C => 60},
    'lightsteelblue'       => {RGB => 'b0c4de', C => 146},
    'lightsteelblue1'      => {RGB => 'cae1ff', C => 189},
    'lightsteelblue2'      => {RGB => 'bcd2ee', C => 110},
    'lightsteelblue3'      => {RGB => 'a2b5cd', C => 146},
    'lightsteelblue4'      => {RGB => '6e7b8b', C => 60},
    'lightyellow'          => {RGB => 'ffffe0', C => 230},
    'lightyellow1'         => {RGB => 'ffffe0', C => 230},
    'lightyellow2'         => {RGB => 'eeeed1', C => 187},
    'lightyellow3'         => {RGB => 'cdcdb4', C => 187},
    'lightyellow4'         => {RGB => '8b8b7a', C => 8},
    'limegreen'            => {RGB => '32cd32', C => 77},
    'linen'                => {RGB => 'faf0e6', C => 180},
    'magenta'              => {RGB => 'ff00ff', C => 201},
    'magenta1'             => {RGB => 'ff00ff', C => 201},
    'magenta2'             => {RGB => 'ee00ee', C => 201},
    'magenta3'             => {RGB => 'cd00cd', C => 164},
    'magenta4'             => {RGB => '8b008b', C => 90},
    'maroon'               => {RGB => 'b03060', C => 5},
    'maroon1'              => {RGB => 'ff34b3', C => 13},
    'maroon2'              => {RGB => 'ee30a7', C => 13},
    'maroon3'              => {RGB => 'cd2990', C => 5},
    'maroon4'              => {RGB => '8b1c62', C => 5},
    'mediumaquamarine'     => {RGB => '66cdaa', C => 115},
    'mediumblue'           => {RGB => '0000cd', C => 4},
    'mediumorchid'         => {RGB => 'ba55d3', C => 134},
    'mediumorchid1'        => {RGB => 'e066ff', C => 171},
    'mediumorchid2'        => {RGB => 'd15fee', C => 171},
    'mediumorchid3'        => {RGB => 'b452cd', C => 134},
    'mediumorchid4'        => {RGB => '7a378b', C => 133},
    'mediumpurple'         => {RGB => '9370db', C => 98},
    'mediumpurple1'        => {RGB => 'ab82ff', C => 141},
    'mediumpurple2'        => {RGB => '9f79ee', C => 98},
    'mediumpurple3'        => {RGB => '8968cd', C => 140},
    'mediumpurple4'        => {RGB => '5d478b', C => 97},
    'mediumseagreen'       => {RGB => '3cb371', C => 78},
    'mediumslateblue'      => {RGB => '7b68ee', C => 99},
    'mediumspringgreen'    => {RGB => '00fa9a', C => 49},
    'mediumturquoise'      => {RGB => '48d1cc', C => 80},
    'mediumvioletred'      => {RGB => 'c71585', C => 5},
    'midnightblue'         => {RGB => '191970', C => 5},
    'mintcream'            => {RGB => 'f5fffa', C => 194},
    'mistyrose'            => {RGB => 'ffe4e1', C => 224},
    'mistyrose1'           => {RGB => 'ffe4e1', C => 224},
    'mistyrose2'           => {RGB => 'eed5d2', C => 181},
    'mistyrose3'           => {RGB => 'cdb7b5', C => 181},
    'mistyrose4'           => {RGB => '8b7d7b', C => 8},
    'moccasin'             => {RGB => 'ffe4b5', C => 223},
    'navajowhite'          => {RGB => 'ffdead', C => 223},
    'navajowhite1'         => {RGB => 'ffdead', C => 223},
    'navajowhite2'         => {RGB => 'eecfa1', C => 179},
    'navajowhite3'         => {RGB => 'cdb38b', C => 180},
    'navajowhite4'         => {RGB => '8b795e', C => 101},
    'navy'                 => {RGB => '000080', C => 18},
    'navyblue'             => {RGB => '000080', C => 18},
    'oldlace'              => {RGB => 'fdf5e6', C => 230},
    'olivedrab'            => {RGB => '6b8e23', C => 149},
    'olivedrab1'           => {RGB => 'c0ff3e', C => 191},
    'olivedrab2'           => {RGB => 'b3ee3a', C => 154},
    'olivedrab3'           => {RGB => '9acd32', C => 149},
    'olivedrab4'           => {RGB => '698b22', C => 149},
    'orange'               => {RGB => 'ffa500', C => 214},
    'orange1'              => {RGB => 'ffa500', C => 214},
    'orange2'              => {RGB => 'ee9a00', C => 214},
    'orange3'              => {RGB => 'cd8500', C => 3},
    'orange4'              => {RGB => '8b5a00', C => 94},
    'orangered'            => {RGB => 'ff4500', C => 202},
    'orangered1'           => {RGB => 'ff4500', C => 202},
    'orangered2'           => {RGB => 'ee4000', C => 202},
    'orangered3'           => {RGB => 'cd3700', C => 1},
    'orangered4'           => {RGB => '8b2500', C => 88},
    'orchid'               => {RGB => 'da70d6', C => 170},
    'orchid1'              => {RGB => 'ff83fa', C => 213},
    'orchid2'              => {RGB => 'ee7ae9', C => 170},
    'orchid3'              => {RGB => 'cd69c9', C => 176},
    'orchid4'              => {RGB => '8b4789', C => 133},
    'palegoldenrod'        => {RGB => 'eee8aa', C => 186},
    'palegreen'            => {RGB => '98fb98', C => 120},
    'palegreen1'           => {RGB => '9aff9a', C => 120},
    'palegreen2'           => {RGB => '90ee90', C => 77},
    'palegreen3'           => {RGB => '7ccd7c', C => 114},
    'palegreen4'           => {RGB => '548b54', C => 65},
    'paleturquoise'        => {RGB => 'afeeee', C => 116},
    'paleturquoise1'       => {RGB => 'bbffff', C => 159},
    'paleturquoise2'       => {RGB => 'aeeeee', C => 116},
    'paleturquoise3'       => {RGB => '96cdcd', C => 152},
    'paleturquoise4'       => {RGB => '668b8b', C => 66},
    'palevioletred'        => {RGB => 'db7093', C => 168},
    'palevioletred1'       => {RGB => 'ff82ab', C => 211},
    'palevioletred2'       => {RGB => 'ee799f', C => 168},
    'palevioletred3'       => {RGB => 'cd6889', C => 175},
    'palevioletred4'       => {RGB => '8b475d', C => 132},
    'papayawhip'           => {RGB => 'ffefd5', C => 230},
    'peachpuff'            => {RGB => 'ffdab9', C => 223},
    'peachpuff1'           => {RGB => 'ffdab9', C => 223},
    'peachpuff2'           => {RGB => 'eecbad', C => 180},
    'peachpuff3'           => {RGB => 'cdaf95', C => 181},
    'peachpuff4'           => {RGB => '8b7765', C => 95},
    'peru'                 => {RGB => 'cd853f', C => 173},
    'pink'                 => {RGB => 'ffc0cb', C => 218},
    'pink1'                => {RGB => 'ffb5c5', C => 218},
    'pink2'                => {RGB => 'eea9b8', C => 168},
    'pink3'                => {RGB => 'cd919e', C => 182},
    'pink4'                => {RGB => '8b636c', C => 96},
    'plum'                 => {RGB => 'dda0dd', C => 176},
    'plum1'                => {RGB => 'ffbbff', C => 219},
    'plum2'                => {RGB => 'eeaeee', C => 176},
    'plum3'                => {RGB => 'cd96cd', C => 182},
    'plum4'                => {RGB => '8b668b', C => 96},
    'powderblue'           => {RGB => 'b0e0e6', C => 116},
    'purple'               => {RGB => 'a020f0', C => 129},
    'purple1'              => {RGB => '9b30ff', C => 13},
    'purple2'              => {RGB => '912cee', C => 13},
    'purple3'              => {RGB => '7d26cd', C => 5},
    'purple4'              => {RGB => '551a8b', C => 5},
    'red'                  => {RGB => 'ff0000', C => 196},
    'red1'                 => {RGB => 'ff0000', C => 196},
    'red2'                 => {RGB => 'ee0000', C => 196},
    'red3'                 => {RGB => 'cd0000', C => 1},
    'red4'                 => {RGB => '8b0000', C => 88},
    'rosybrown'            => {RGB => 'bc8f8f', C => 138},
    'rosybrown1'           => {RGB => 'ffc1c1', C => 217},
    'rosybrown2'           => {RGB => 'eeb4b4', C => 174},
    'rosybrown3'           => {RGB => 'cd9b9b', C => 181},
    'rosybrown4'           => {RGB => '8b6969', C => 95},
    'royalblue'            => {RGB => '4169e1', C => 5},
    'royalblue1'           => {RGB => '4876ff', C => 69},
    'royalblue2'           => {RGB => '436eee', C => 13},
    'royalblue3'           => {RGB => '3a5fcd', C => 68},
    'royalblue4'           => {RGB => '27408b', C => 5},
    'saddlebrown'          => {RGB => '8b4513', C => 130},
    'salmon'               => {RGB => 'fa8072', C => 203},
    'salmon1'              => {RGB => 'ff8c69', C => 209},
    'salmon2'              => {RGB => 'ee8262', C => 209},
    'salmon3'              => {RGB => 'cd7054', C => 173},
    'salmon4'              => {RGB => '8b4c39', C => 131},
    'sandybrown'           => {RGB => 'f4a460', C => 215},
    'seagreen'             => {RGB => '2e8b57', C => 72},
    'seagreen1'            => {RGB => '54ff9f', C => 85},
    'seagreen2'            => {RGB => '4eee94', C => 85},
    'seagreen3'            => {RGB => '43cd80', C => 78},
    'seagreen4'            => {RGB => '2e8b57', C => 72},
    'seashell'             => {RGB => 'fff5ee', C => 224},
    'seashell1'            => {RGB => 'fff5ee', C => 224},
    'seashell2'            => {RGB => 'eee5de', C => 181},
    'seashell3'            => {RGB => 'cdc5bf', C => 251},
    'seashell4'            => {RGB => '8b8682', C => 102},
    'sienna'               => {RGB => 'a0522d', C => 173},
    'sienna1'              => {RGB => 'ff8247', C => 209},
    'sienna2'              => {RGB => 'ee7942', C => 209},
    'sienna3'              => {RGB => 'cd6839', C => 173},
    'sienna4'              => {RGB => '8b4726', C => 173},
    'skyblue'              => {RGB => '87ceeb', C => 74},
    'skyblue1'             => {RGB => '87ceff', C => 117},
    'skyblue2'             => {RGB => '7ec0ee', C => 74},
    'skyblue3'             => {RGB => '6ca6cd', C => 110},
    'skyblue4'             => {RGB => '4a708b', C => 67},
    'slateblue'            => {RGB => '6a5acd', C => 62},
    'slateblue1'           => {RGB => '836fff', C => 99},
    'slateblue2'           => {RGB => '7a67ee', C => 99},
    'slateblue3'           => {RGB => '6959cd', C => 62},
    'slateblue4'           => {RGB => '473c8b', C => 61},
    'slategray'            => {RGB => '708090', C => 60},
    'slategray1'           => {RGB => 'c6e2ff', C => 189},
    'slategray2'           => {RGB => 'b9d3ee', C => 110},
    'slategray3'           => {RGB => '9fb6cd', C => 146},
    'slategray4'           => {RGB => '6c7b8b', C => 60},
    'slategrey'            => {RGB => '708090', C => 60},
    'snow'                 => {RGB => 'fffafa', C => 224},
    'snow1'                => {RGB => 'fffafa', C => 224},
    'snow2'                => {RGB => 'eee9e9', C => 255},
    'snow3'                => {RGB => 'cdc9c9', C => 7},
    'snow4'                => {RGB => '8b8989', C => 245},
    'springgreen'          => {RGB => '00ff7f', C => 48},
    'springgreen1'         => {RGB => '00ff7f', C => 48},
    'springgreen2'         => {RGB => '00ee76', C => 48},
    'springgreen3'         => {RGB => '00cd66', C => 41},
    'springgreen4'         => {RGB => '008b45', C => 29},
    'steelblue'            => {RGB => '4682b4', C => 67},
    'steelblue1'           => {RGB => '63b8ff', C => 75},
    'steelblue2'           => {RGB => '5cacee', C => 75},
    'steelblue3'           => {RGB => '4f94cd', C => 74},
    'steelblue4'           => {RGB => '36648b', C => 67},
    'tan'                  => {RGB => 'd2b48c', C => 180},
    'tan1'                 => {RGB => 'ffa54f', C => 215},
    'tan2'                 => {RGB => 'ee9a49', C => 215},
    'tan3'                 => {RGB => 'cd853f', C => 173},
    'tan4'                 => {RGB => '8b5a2b', C => 137},
    'thistle'              => {RGB => 'd8bfd8', C => 182},
    'thistle1'             => {RGB => 'ffe1ff', C => 225},
    'thistle2'             => {RGB => 'eed2ee', C => 182},
    'thistle3'             => {RGB => 'cdb5cd', C => 182},
    'thistle4'             => {RGB => '8b7b8b', C => 96},
    'tomato'               => {RGB => 'ff6347', C => 209},
    'tomato1'              => {RGB => 'ff6347', C => 209},
    'tomato2'              => {RGB => 'ee5c42', C => 209},
    'tomato3'              => {RGB => 'cd4f39', C => 167},
    'tomato4'              => {RGB => '8b3626', C => 167},
    'turquoise'            => {RGB => '40e0d0', C => 80},
    'turquoise1'           => {RGB => '00f5ff', C => 14},
    'turquoise2'           => {RGB => '00e5ee', C => 14},
    'turquoise3'           => {RGB => '00c5cd', C => 6},
    'turquoise4'           => {RGB => '00868b', C => 30},
    'violet'               => {RGB => 'ee82ee', C => 170},
    'violetred'            => {RGB => 'd02090', C => 5},
    'violetred1'           => {RGB => 'ff3e96', C => 13},
    'violetred2'           => {RGB => 'ee3a8c', C => 13},
    'violetred3'           => {RGB => 'cd3278', C => 168},
    'violetred4'           => {RGB => '8b2252', C => 5},
    'wheat'                => {RGB => 'f5deb3', C => 223},
    'wheat1'               => {RGB => 'ffe7ba', C => 223},
    'wheat2'               => {RGB => 'eed8ae', C => 180},
    'wheat3'               => {RGB => 'cdba96', C => 187},
    'wheat4'               => {RGB => '8b7e66', C => 101},
    'white'                => {RGB => 'ffffff', C => 15},
    'whitesmoke'           => {RGB => 'f5f5f5', C => 255},
    'yellow'               => {RGB => 'ffff00', C => 226},
    'yellow1'              => {RGB => 'ffff00', C => 226},
    'yellow2'              => {RGB => 'eeee00', C => 226},
    'yellow3'              => {RGB => 'cdcd00', C => 3},
    'yellow4'              => {RGB => '8b8b00', C => 100},
    'yellowgreen'          => {RGB => '9acd32', C => 149},
); # }}}
my @hsl2term_table = (	# {{{
    {RGB => '000000', H => 0,   S => 0,    L => 0,    C => 0},
    {RGB => 'cf1700', H => 7,   S => 1000, L => 405,  C => 1},
    {RGB => '00c800', H => 120, S => 1000, L => 392,  C => 2},
    {RGB => 'ccca00', H => 59,  S => 1000, L => 400,  C => 3},
    {RGB => '0016cc', H => 234, S => 1000, L => 400,  C => 4},
    {RGB => 'c521cc', H => 298, S => 721,  L => 464,  C => 5},
    {RGB => '00ccca', H => 179, S => 1000, L => 400,  C => 6},
    {RGB => 'cccccc', H => 0,   S => 0,    L => 800,  C => 7},
    {RGB => '808080', H => 0,   S => 0,    L => 501,  C => 8},
    {RGB => 'ff1d00', H => 7,   S => 1000, L => 500,  C => 9},
    {RGB => '00fa00', H => 120, S => 1000, L => 490,  C => 10},
    {RGB => 'fffc00', H => 59,  S => 1000, L => 500,  C => 11},
    {RGB => '001bff', H => 234, S => 1000, L => 500,  C => 12},
    {RGB => 'ff29ff', H => 300, S => 1000, L => 580,  C => 13},
    {RGB => '00fcff', H => 181, S => 1000, L => 500,  C => 14},
    {RGB => 'ffffff', H => 0,   S => 0,    L => 1000, C => 15},
    {RGB => '000000', H => 0,   S => 0,    L => 0,    C => 16},
    {RGB => '00005f', H => 240, S => 1000, L => 186,  C => 17},
    {RGB => '000087', H => 240, S => 1000, L => 264,  C => 18},
    {RGB => '0000af', H => 240, S => 1000, L => 343,  C => 19},
    {RGB => '0000d7', H => 240, S => 1000, L => 421,  C => 20},
    {RGB => '0000ff', H => 240, S => 1000, L => 500,  C => 21},
    {RGB => '005f00', H => 120, S => 1000, L => 186,  C => 22},
    {RGB => '005f5f', H => 180, S => 1000, L => 186,  C => 23},
    {RGB => '005f87', H => 198, S => 1000, L => 264,  C => 24},
    {RGB => '005faf', H => 207, S => 1000, L => 343,  C => 25},
    {RGB => '005fd7', H => 213, S => 1000, L => 421,  C => 26},
    {RGB => '005fff', H => 218, S => 1000, L => 500,  C => 27},
    {RGB => '008700', H => 120, S => 1000, L => 264,  C => 28},
    {RGB => '00875f', H => 162, S => 1000, L => 264,  C => 29},
    {RGB => '008787', H => 180, S => 1000, L => 264,  C => 30},
    {RGB => '0087af', H => 194, S => 1000, L => 343,  C => 31},
    {RGB => '0087d7', H => 202, S => 1000, L => 421,  C => 32},
    {RGB => '0087ff', H => 208, S => 1000, L => 500,  C => 33},
    {RGB => '00af00', H => 120, S => 1000, L => 343,  C => 34},
    {RGB => '00af5f', H => 153, S => 1000, L => 343,  C => 35},
    {RGB => '00af87', H => 166, S => 1000, L => 343,  C => 36},
    {RGB => '00afaf', H => 180, S => 1000, L => 343,  C => 37},
    {RGB => '00afd7', H => 191, S => 1000, L => 421,  C => 38},
    {RGB => '00afff', H => 199, S => 1000, L => 500,  C => 39},
    {RGB => '00d700', H => 120, S => 1000, L => 421,  C => 40},
    {RGB => '00d75f', H => 147, S => 1000, L => 421,  C => 41},
    {RGB => '00d787', H => 158, S => 1000, L => 421,  C => 42},
    {RGB => '00d7af', H => 169, S => 1000, L => 421,  C => 43},
    {RGB => '00d7d7', H => 180, S => 1000, L => 421,  C => 44},
    {RGB => '00d7ff', H => 189, S => 1000, L => 500,  C => 45},
    {RGB => '00ff00', H => 120, S => 1000, L => 500,  C => 46},
    {RGB => '00ff5f', H => 142, S => 1000, L => 500,  C => 47},
    {RGB => '00ff87', H => 152, S => 1000, L => 500,  C => 48},
    {RGB => '00ffaf', H => 161, S => 1000, L => 500,  C => 49},
    {RGB => '00ffd7', H => 171, S => 1000, L => 500,  C => 50},
    {RGB => '00ffff', H => 180, S => 1000, L => 500,  C => 51},
    {RGB => '5f0000', H => 0,   S => 1000, L => 186,  C => 52},
    {RGB => '5f005f', H => 300, S => 1000, L => 186,  C => 53},
    {RGB => '5f0087', H => 282, S => 1000, L => 264,  C => 54},
    {RGB => '5f00af', H => 273, S => 1000, L => 343,  C => 55},
    {RGB => '5f00d7', H => 267, S => 1000, L => 421,  C => 56},
    {RGB => '5f00ff', H => 262, S => 1000, L => 500,  C => 57},
    {RGB => '5f5f00', H => 60,  S => 1000, L => 186,  C => 58},
    {RGB => '5f5f5f', H => 0,   S => 0,    L => 372,  C => 59},
    {RGB => '5f5f87', H => 240, S => 173,  L => 450,  C => 60},
    {RGB => '5f5faf', H => 240, S => 333,  L => 529,  C => 61},
    {RGB => '5f5fd7', H => 240, S => 600,  L => 607,  C => 62},
    {RGB => '5f5fff', H => 240, S => 1000, L => 686,  C => 63},
    {RGB => '5f8700', H => 78,  S => 1000, L => 264,  C => 64},
    {RGB => '5f875f', H => 120, S => 173,  L => 450,  C => 65},
    {RGB => '5f8787', H => 180, S => 173,  L => 450,  C => 66},
    {RGB => '5f87af', H => 210, S => 333,  L => 529,  C => 67},
    {RGB => '5f87d7', H => 220, S => 600,  L => 607,  C => 68},
    {RGB => '5f87ff', H => 225, S => 1000, L => 686,  C => 69},
    {RGB => '5faf00', H => 87,  S => 1000, L => 343,  C => 70},
    {RGB => '5faf5f', H => 120, S => 333,  L => 529,  C => 71},
    {RGB => '5faf87', H => 150, S => 333,  L => 529,  C => 72},
    {RGB => '5fafaf', H => 180, S => 333,  L => 529,  C => 73},
    {RGB => '5fafd7', H => 200, S => 600,  L => 607,  C => 74},
    {RGB => '5fafff', H => 210, S => 1000, L => 686,  C => 75},
    {RGB => '5fd700', H => 93,  S => 1000, L => 421,  C => 76},
    {RGB => '5fd75f', H => 120, S => 600,  L => 607,  C => 77},
    {RGB => '5fd787', H => 140, S => 600,  L => 607,  C => 78},
    {RGB => '5fd7af', H => 160, S => 600,  L => 607,  C => 79},
    {RGB => '5fd7d7', H => 180, S => 600,  L => 607,  C => 80},
    {RGB => '5fd7ff', H => 195, S => 1000, L => 686,  C => 81},
    {RGB => '5fff00', H => 98,  S => 1000, L => 500,  C => 82},
    {RGB => '5fff5f', H => 120, S => 1000, L => 686,  C => 83},
    {RGB => '5fff87', H => 135, S => 1000, L => 686,  C => 84},
    {RGB => '5fffaf', H => 150, S => 1000, L => 686,  C => 85},
    {RGB => '5fffd7', H => 165, S => 1000, L => 686,  C => 86},
    {RGB => '5fffff', H => 180, S => 1000, L => 686,  C => 87},
    {RGB => '870000', H => 0,   S => 1000, L => 264,  C => 88},
    {RGB => '87005f', H => 318, S => 1000, L => 264,  C => 89},
    {RGB => '870087', H => 300, S => 1000, L => 264,  C => 90},
    {RGB => '8700af', H => 286, S => 1000, L => 343,  C => 91},
    {RGB => '8700d7', H => 278, S => 1000, L => 421,  C => 92},
    {RGB => '8700ff', H => 272, S => 1000, L => 500,  C => 93},
    {RGB => '875f00', H => 42,  S => 1000, L => 264,  C => 94},
    {RGB => '875f5f', H => 0,   S => 173,  L => 450,  C => 95},
    {RGB => '875f87', H => 300, S => 173,  L => 450,  C => 96},
    {RGB => '875faf', H => 270, S => 333,  L => 529,  C => 97},
    {RGB => '875fd7', H => 260, S => 600,  L => 607,  C => 98},
    {RGB => '875fff', H => 255, S => 1000, L => 686,  C => 99},
    {RGB => '878700', H => 60,  S => 1000, L => 264,  C => 100},
    {RGB => '87875f', H => 60,  S => 173,  L => 450,  C => 101},
    {RGB => '878787', H => 0,   S => 0,    L => 529,  C => 102},
    {RGB => '8787af', H => 240, S => 200,  L => 607,  C => 103},
    {RGB => '8787d7', H => 240, S => 500,  L => 686,  C => 104},
    {RGB => '8787ff', H => 240, S => 999,  L => 764,  C => 105},
    {RGB => '87af00', H => 74,  S => 1000, L => 343,  C => 106},
    {RGB => '87af5f', H => 90,  S => 333,  L => 529,  C => 107},
    {RGB => '87af87', H => 120, S => 200,  L => 607,  C => 108},
    {RGB => '87afaf', H => 180, S => 200,  L => 607,  C => 109},
    {RGB => '87afd7', H => 210, S => 500,  L => 686,  C => 110},
    {RGB => '87afff', H => 220, S => 999,  L => 764,  C => 111},
    {RGB => '87d700', H => 82,  S => 1000, L => 421,  C => 112},
    {RGB => '87d75f', H => 100, S => 600,  L => 607,  C => 113},
    {RGB => '87d787', H => 120, S => 500,  L => 686,  C => 114},
    {RGB => '87d7af', H => 150, S => 500,  L => 686,  C => 115},
    {RGB => '87d7d7', H => 180, S => 500,  L => 686,  C => 116},
    {RGB => '87d7ff', H => 200, S => 999,  L => 764,  C => 117},
    {RGB => '87ff00', H => 88,  S => 1000, L => 500,  C => 118},
    {RGB => '87ff5f', H => 105, S => 1000, L => 686,  C => 119},
    {RGB => '87ff87', H => 120, S => 999,  L => 764,  C => 120},
    {RGB => '87ffaf', H => 140, S => 999,  L => 764,  C => 121},
    {RGB => '87ffd7', H => 160, S => 999,  L => 764,  C => 122},
    {RGB => '87ffff', H => 180, S => 999,  L => 764,  C => 123},
    {RGB => 'af0000', H => 0,   S => 1000, L => 343,  C => 124},
    {RGB => 'af005f', H => 327, S => 1000, L => 343,  C => 125},
    {RGB => 'af0087', H => 314, S => 1000, L => 343,  C => 126},
    {RGB => 'af00af', H => 300, S => 1000, L => 343,  C => 127},
    {RGB => 'af00d7', H => 289, S => 1000, L => 421,  C => 128},
    {RGB => 'af00ff', H => 281, S => 1000, L => 500,  C => 129},
    {RGB => 'af5f00', H => 33,  S => 1000, L => 343,  C => 130},
    {RGB => 'af5f5f', H => 0,   S => 333,  L => 529,  C => 131},
    {RGB => 'af5f87', H => 330, S => 333,  L => 529,  C => 132},
    {RGB => 'af5faf', H => 300, S => 333,  L => 529,  C => 133},
    {RGB => 'af5fd7', H => 280, S => 600,  L => 607,  C => 134},
    {RGB => 'af5fff', H => 270, S => 1000, L => 686,  C => 135},
    {RGB => 'af8700', H => 46,  S => 1000, L => 343,  C => 136},
    {RGB => 'af875f', H => 30,  S => 333,  L => 529,  C => 137},
    {RGB => 'af8787', H => 0,   S => 200,  L => 607,  C => 138},
    {RGB => 'af87af', H => 300, S => 200,  L => 607,  C => 139},
    {RGB => 'af87d7', H => 270, S => 500,  L => 686,  C => 140},
    {RGB => 'af87ff', H => 260, S => 999,  L => 764,  C => 141},
    {RGB => 'afaf00', H => 60,  S => 1000, L => 343,  C => 142},
    {RGB => 'afaf5f', H => 60,  S => 333,  L => 529,  C => 143},
    {RGB => 'afaf87', H => 60,  S => 200,  L => 607,  C => 144},
    {RGB => 'afafaf', H => 0,   S => 0,    L => 686,  C => 145},
    {RGB => 'afafd7', H => 240, S => 333,  L => 764,  C => 146},
    {RGB => 'afafff', H => 240, S => 1000, L => 843,  C => 147},
    {RGB => 'afd700', H => 71,  S => 1000, L => 421,  C => 148},
    {RGB => 'afd75f', H => 80,  S => 600,  L => 607,  C => 149},
    {RGB => 'afd787', H => 90,  S => 500,  L => 686,  C => 150},
    {RGB => 'afd7af', H => 120, S => 333,  L => 764,  C => 151},
    {RGB => 'afd7d7', H => 180, S => 333,  L => 764,  C => 152},
    {RGB => 'afd7ff', H => 210, S => 1000, L => 843,  C => 153},
    {RGB => 'afff00', H => 79,  S => 1000, L => 500,  C => 154},
    {RGB => 'afff5f', H => 90,  S => 1000, L => 686,  C => 155},
    {RGB => 'afff87', H => 100, S => 999,  L => 764,  C => 156},
    {RGB => 'afffaf', H => 120, S => 1000, L => 843,  C => 157},
    {RGB => 'afffd7', H => 150, S => 1000, L => 843,  C => 158},
    {RGB => 'afffff', H => 180, S => 1000, L => 843,  C => 159},
    {RGB => 'd70000', H => 0,   S => 1000, L => 421,  C => 160},
    {RGB => 'd7005f', H => 333, S => 1000, L => 421,  C => 161},
    {RGB => 'd70087', H => 322, S => 1000, L => 421,  C => 162},
    {RGB => 'd700af', H => 311, S => 1000, L => 421,  C => 163},
    {RGB => 'd700d7', H => 300, S => 1000, L => 421,  C => 164},
    {RGB => 'd700ff', H => 291, S => 1000, L => 500,  C => 165},
    {RGB => 'd75f00', H => 27,  S => 1000, L => 421,  C => 166},
    {RGB => 'd75f5f', H => 0,   S => 600,  L => 607,  C => 167},
    {RGB => 'd75f87', H => 340, S => 600,  L => 607,  C => 168},
    {RGB => 'd75faf', H => 320, S => 600,  L => 607,  C => 169},
    {RGB => 'd75fd7', H => 300, S => 600,  L => 607,  C => 170},
    {RGB => 'd75fff', H => 285, S => 1000, L => 686,  C => 171},
    {RGB => 'd78700', H => 38,  S => 1000, L => 421,  C => 172},
    {RGB => 'd7875f', H => 20,  S => 600,  L => 607,  C => 173},
    {RGB => 'd78787', H => 0,   S => 500,  L => 686,  C => 174},
    {RGB => 'd787af', H => 330, S => 500,  L => 686,  C => 175},
    {RGB => 'd787d7', H => 300, S => 500,  L => 686,  C => 176},
    {RGB => 'd787ff', H => 280, S => 999,  L => 764,  C => 177},
    {RGB => 'd7af00', H => 49,  S => 1000, L => 421,  C => 178},
    {RGB => 'd7af5f', H => 40,  S => 600,  L => 607,  C => 179},
    {RGB => 'd7af87', H => 30,  S => 500,  L => 686,  C => 180},
    {RGB => 'd7afaf', H => 0,   S => 333,  L => 764,  C => 181},
    {RGB => 'd7afd7', H => 300, S => 333,  L => 764,  C => 182},
    {RGB => 'd7afff', H => 270, S => 1000, L => 843,  C => 183},
    {RGB => 'd7d700', H => 60,  S => 1000, L => 421,  C => 184},
    {RGB => 'd7d75f', H => 60,  S => 600,  L => 607,  C => 185},
    {RGB => 'd7d787', H => 60,  S => 500,  L => 686,  C => 186},
    {RGB => 'd7d7af', H => 60,  S => 333,  L => 764,  C => 187},
    {RGB => 'd7d7d7', H => 0,   S => 0,    L => 843,  C => 188},
    {RGB => 'd7d7ff', H => 240, S => 1000, L => 921,  C => 189},
    {RGB => 'd7ff00', H => 69,  S => 1000, L => 500,  C => 190},
    {RGB => 'd7ff5f', H => 75,  S => 1000, L => 686,  C => 191},
    {RGB => 'd7ff87', H => 80,  S => 999,  L => 764,  C => 192},
    {RGB => 'd7ffaf', H => 90,  S => 1000, L => 843,  C => 193},
    {RGB => 'd7ffd7', H => 120, S => 1000, L => 921,  C => 194},
    {RGB => 'd7ffff', H => 180, S => 1000, L => 921,  C => 195},
    {RGB => 'ff0000', H => 0,   S => 1000, L => 500,  C => 196},
    {RGB => 'ff005f', H => 338, S => 1000, L => 500,  C => 197},
    {RGB => 'ff0087', H => 328, S => 1000, L => 500,  C => 198},
    {RGB => 'ff00af', H => 319, S => 1000, L => 500,  C => 199},
    {RGB => 'ff00d7', H => 309, S => 1000, L => 500,  C => 200},
    {RGB => 'ff00ff', H => 300, S => 1000, L => 500,  C => 201},
    {RGB => 'ff5f00', H => 22,  S => 1000, L => 500,  C => 202},
    {RGB => 'ff5f5f', H => 0,   S => 1000, L => 686,  C => 203},
    {RGB => 'ff5f87', H => 345, S => 1000, L => 686,  C => 204},
    {RGB => 'ff5faf', H => 330, S => 1000, L => 686,  C => 205},
    {RGB => 'ff5fd7', H => 315, S => 1000, L => 686,  C => 206},
    {RGB => 'ff5fff', H => 300, S => 1000, L => 686,  C => 207},
    {RGB => 'ff8700', H => 32,  S => 1000, L => 500,  C => 208},
    {RGB => 'ff875f', H => 15,  S => 1000, L => 686,  C => 209},
    {RGB => 'ff8787', H => 0,   S => 999,  L => 764,  C => 210},
    {RGB => 'ff87af', H => 340, S => 999,  L => 764,  C => 211},
    {RGB => 'ff87d7', H => 320, S => 999,  L => 764,  C => 212},
    {RGB => 'ff87ff', H => 300, S => 999,  L => 764,  C => 213},
    {RGB => 'ffaf00', H => 41,  S => 1000, L => 500,  C => 214},
    {RGB => 'ffaf5f', H => 30,  S => 1000, L => 686,  C => 215},
    {RGB => 'ffaf87', H => 20,  S => 999,  L => 764,  C => 216},
    {RGB => 'ffafaf', H => 0,   S => 1000, L => 843,  C => 217},
    {RGB => 'ffafd7', H => 330, S => 1000, L => 843,  C => 218},
    {RGB => 'ffafff', H => 300, S => 1000, L => 843,  C => 219},
    {RGB => 'ffd700', H => 51,  S => 1000, L => 500,  C => 220},
    {RGB => 'ffd75f', H => 45,  S => 1000, L => 686,  C => 221},
    {RGB => 'ffd787', H => 40,  S => 999,  L => 764,  C => 222},
    {RGB => 'ffd7af', H => 30,  S => 1000, L => 843,  C => 223},
    {RGB => 'ffd7d7', H => 0,   S => 1000, L => 921,  C => 224},
    {RGB => 'ffd7ff', H => 300, S => 1000, L => 921,  C => 225},
    {RGB => 'ffff00', H => 60,  S => 1000, L => 500,  C => 226},
    {RGB => 'ffff5f', H => 60,  S => 1000, L => 686,  C => 227},
    {RGB => 'ffff87', H => 60,  S => 999,  L => 764,  C => 228},
    {RGB => 'ffffaf', H => 60,  S => 1000, L => 843,  C => 229},
    {RGB => 'ffffd7', H => 60,  S => 1000, L => 921,  C => 230},
    {RGB => 'ffffff', H => 0,   S => 0,    L => 1000, C => 231},
    {RGB => '080808', H => 0,   S => 0,    L => 31,   C => 232},
    {RGB => '121212', H => 0,   S => 0,    L => 70,   C => 233},
    {RGB => '1c1c1c', H => 0,   S => 0,    L => 109,  C => 234},
    {RGB => '262626', H => 0,   S => 0,    L => 149,  C => 235},
    {RGB => '303030', H => 0,   S => 0,    L => 188,  C => 236},
    {RGB => '3a3a3a', H => 0,   S => 0,    L => 227,  C => 237},
    {RGB => '444444', H => 0,   S => 0,    L => 266,  C => 238},
    {RGB => '4e4e4e', H => 0,   S => 0,    L => 305,  C => 239},
    {RGB => '585858', H => 0,   S => 0,    L => 345,  C => 240},
    {RGB => '626262', H => 0,   S => 0,    L => 384,  C => 241},
    {RGB => '6c6c6c', H => 0,   S => 0,    L => 423,  C => 242},
    {RGB => '767676', H => 0,   S => 0,    L => 462,  C => 243},
    {RGB => '808080', H => 0,   S => 0,    L => 501,  C => 244},
    {RGB => '8a8a8a', H => 0,   S => 0,    L => 541,  C => 245},
    {RGB => '949494', H => 0,   S => 0,    L => 580,  C => 246},
    {RGB => '9e9e9e', H => 0,   S => 0,    L => 619,  C => 247},
    {RGB => 'a8a8a8', H => 0,   S => 0,    L => 658,  C => 248},
    {RGB => 'b2b2b2', H => 0,   S => 0,    L => 698,  C => 249},
    {RGB => 'bcbcbc', H => 0,   S => 0,    L => 737,  C => 250},
    {RGB => 'c6c6c6', H => 0,   S => 0,    L => 776,  C => 251},
    {RGB => 'd0d0d0', H => 0,   S => 0,    L => 815,  C => 252},
    {RGB => 'dadada', H => 0,   S => 0,    L => 854,  C => 253},
    {RGB => 'e4e4e4', H => 0,   S => 0,    L => 894,  C => 254},
    {RGB => 'eeeeee', H => 0,   S => 0,    L => 933,  C => 255},
);	# }}}
sub fclamp {	# {{{
    my ($num, $min, $max) = @_;
    return $max if $num > $max;
    return $min if $num < $min;
    return $num;
}	# }}}
sub fmax {	# {{{
    my ($a, $b) = @_;
    return $a>$b?$a:$b;
}	# }}}
sub fmin {	# {{{
    my ($a, $b) = @_;
    return $a<$b?$a:$b;
}	# }}}
sub rgb2hsl {	# {{{
    my ($r, $g, $b) = @_;
    my ($min, $max, $delta);
    my ($h, $l, $s);

    $r = fclamp($r/255.0, 0.0, 1.0);
    $g = fclamp($g/255.0, 0.0, 1.0);
    $b = fclamp($b/255.0, 0.0, 1.0);

    $max = fmax(fmax($r, $g), $b);
    $min = fmin(fmin($r, $g), $b);

    $l = ($max + $min) / 2;
    $delta = $max - $min;

    if ( $max == $min ) {
        $h = 0;
    } else {
        if ($r == $max) {
            $h = 60 * (($g - $b) / $delta);
            $h += 360 if $g < $b;
        } elsif ($g == $max) {
            $h = (60 * (($b - $r) / $delta)) + 120;
        } else {
            $h = (60 * (($r - $g) / $delta)) + 240;
        }
    }

    if ( $max == $min || $l == 0 ) {
        $s = 0;
    } else {
        if ($l <= 0.5) {
            $s = $delta / ($max + $min);
        } else {
            $s = $delta / (2.0 - ($max + $min));
        }
    }

    $s = int(1000 * $s);
    $l = int(1000 * $l);
    $h = int($h + .5);

    return ($h, $s, $l);
}	# }}}
sub hsl2rgb {	# {{{
    my ($h, $s, $l) = @_;

    $s /= 1000.0;
    $l /= 1000.0;

    if ( $s == 0 ) {
        return ($l, $l, $l);
    }

    my ($r, $g, $b);
    my ($p, $q);

    if ( $l < 0.5 ) {
        $q = $l * (1.0 + $s);
    } else {
        $q = $l + $s - ($l * $s);
    }

    $p = (2.0 * $l) - $q;
    $h /= 360;

    $r = $h + (1 / 3);
    $g = $h;
    $b = $h - (1 / 3);

    $r += 1.0 if $r < 0;
    $g += 1.0 if $g < 0;
    $b += 1.0 if $b < 0;

    $r -= 1.0 if $r > 1;
    $g -= 1.0 if $g > 1;
    $b -= 1.0 if $b > 1;

    if ($r < (1 / 6)) {
        $r = $p + (($q - $p) * 6.0 * $r) ;
    } elsif ( $r < 0.5 ) {
        $r = $q;
    } elsif ( $r < (2 / 3)) {
        $r = $p + (($q - $p) * ((2 / 3) - $r) * 6.0);
    } else {
        $r = $p;
    }

    if ($g < (1 / 6)) {
        $g = $p + (($q - $p) * 6.0 * $g) ;
    } elsif ( $g < 0.5 ) {
        $g = $q;
    } elsif ( $g < (2 / 3)) {
        $g = $p + (($q - $p) * ((2 / 3) - $g) * 6.0);
    } else {
        $g = $p;
    }

    if ($b < (1 / 6)) {
        $b = $p + (($q - $p) * 6.0 * $b) ;
    } elsif ( $b < 0.5 ) {
        $b = $q;
    } elsif ( $b < (2 / 3)) {
        $b = $p + (($q - $p) * ((2 / 3) - $b) * 6.0);
    } else {
        $b = $p;
    }

    $r = int($r * 255);
    $g = int($g * 255);
    $b = int($b * 255);

    return ($r, $g, $b);
}	# }}}

sub closest_color_match { # {{{
    my ($r, $g, $b) = @_;
    my ($color, $distance, $shortest, $term);
    my ($h, $s, $l) = rgb2hsl($r, $g, $b);
    $shortest = 9999999;

    foreach $color ( @hsl2term_table ) {
        $distance = (($h - $$color{H})**2 + ($s - $$color{S})**2 + ($l - $$color{L})**2);
        if ( $distance < $shortest ) {
            $shortest = $distance;
            $term = $$color{C};
        }
    }
    return $term;
} # }}}

my %color_scheme;
my ($item, @item_list);
my $group;
my $color;
my $line = 1;
while ( <> ) {

    if (
            ! /^\s*hi/
            || /^\s*hi(ghlight)?\s+clear/
            || /^\s*hi(ghlight)?\s+link/
       )
    {
        next;
    }

    chomp;
    (undef, $group, @item_list) = split /\s+/;

    $color_scheme{lc $group}{group} = $group;
    $group = lc $group;
    $color_scheme{$group}{line} = $line;

    foreach $item ( @item_list ) {
        # ignore: term, cterm[fg,bg], font {{{
        if (
             $item =~ /^c?term(fg|bg)*=/ ||
             $item =~ /^font=/
           )
        {
            next;

        # }}}
        # gui {{{
        } elsif ( $item =~ /^gui=(.*)$/ ) {
            $color_scheme{$group}{cterm} = $1;

        # }}}
        # guifg {{{
        } elsif ( $item =~ /^guifg=(.*)$/ ) {
            $color = lc $1;

            # none
            if ( $color eq 'none' ) {
                next;

            # fg
            } elsif ( $color eq 'fg' || $color eq 'foreground' ) {
                $color_scheme{$group}{ctermfg} = 'fg'

            # bg
            } elsif ( $color eq 'bg' || $color eq 'background' ) {
                $color_scheme{$group}{ctermbg} = 'bg';

            # hex rgb
            } elsif ( substr($color, 0, 1) eq '#' && length($color) == 7 ) {
                $color_scheme{$group}{ctermfg} = closest_color_match(
                    eval('0x'.substr($color, 1, 2)),
                    eval('0x'.substr($color, 3, 2)),
                    eval('0x'.substr($color, 5, 2))
                );

            } else {
                # named
                $color =~ s/\s+//g;
                if ( exists $color_names_table{$color} ) {
                    $color_scheme{$group}{ctermfg} = $color_names_table{$color}{C};

                # bad color
                } else {
                    print STDERR "unknown color: $color in $group guifg\n";
                }
            }

        # }}}
        # guibg {{{
        } elsif ( $item =~ /^guibg=(.*)$/ ) {
            $color = lc $1;

            # none
            if ( $color eq 'none' ) {
                next;

            # fg
            } elsif ( $color eq 'fg' || $color eq 'foreground' ) {
                $color_scheme{$group}{ctermfg} = 'fg'

            # bg
            } elsif ( $color eq 'bg' || $color eq 'background' ) {
                $color_scheme{$group}{ctermbg} = 'bg';

            # hex rgb
            } elsif ( substr($color, 0, 1) eq '#' && length($color) == 7 ) {
                $color_scheme{$group}{ctermbg} = closest_color_match(
                    eval('0x'.substr($color, 1, 2)),
                    eval('0x'.substr($color, 3, 2)),
                    eval('0x'.substr($color, 5, 2))
                );

            } else {
                # named
                $color =~ s/\s+//g;
                if ( exists $color_names_table{$color} ) {
                    $color_scheme{$group}{ctermbg} = $color_names_table{$color}{C};

                # bad color
                } else {
                    print STDERR "unknown color: $color in $group guibg\n";
                }
            }
        # }}}
        # unknown token {{{
        } else {
            print STDERR "error unknown token: $item\n";
        } # }}}
    }
}

# default fg and bg colors
my ($fg, $bg) = (7, 0);

# ovewrite fg color if found
if ( exists $color_scheme{'normal'}{ctermfg} ) {
    $fg = $color_scheme{'normal'}{ctermfg};
}

# ovewrite bg color if found
if ( exists $color_scheme{'normal'}{ctermbg} ) {
    $bg = $color_scheme{'normal'}{ctermbg};
}

# print out the color scheme
foreach $group ( sort keys %color_scheme ) {
    print "highlight ".$color_scheme{$group}{group};
    if ( exists $color_scheme{$group}{cterm} ) {
        print " cterm=".$color_scheme{$group}{cterm};
    }
    if ( exists $color_scheme{$group}{ctermfg} ) {
        $color = $color_scheme{$group}{ctermfg};
        $color = $fg if $color eq 'fg';
        print " ctermfg=".$color;
    }
    if ( exists $color_scheme{$group}{ctermbg} ) {
        $color = $color_scheme{$group}{ctermbg};
        $color = $bg if $color eq 'bg';
        print " ctermbg=".$color;
    }
    print "\n";
}

# vim:fdm=marker:
