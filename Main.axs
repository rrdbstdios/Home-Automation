PROGRAM_NAME='Main rack'

(***********************************************************)
(* System Type : NetLinx                                   *)
(***********************************************************)
(* REV HISTORY:                                            *)
(***********************************************************)
(*
    $History: $1 - 1/22/2013
*)

/* system incl */
include 'string'

(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_DEVICE

// IP Devices
dvAppleTV 				= 0:4:0;
dvWeather				= 0:6:0;

dvBluray				= 5001:1:0;

// IR Devices
dvCableBox				= 5001:3:0;		// 9 Pace,RGN200N,UR5U-9020L-MC,Settop Box,1.irl
//dvBDP					= 5001:10:0;		// for debuging

// Touch panels
dvTP1_TP_iPad	 			= 10001:1:0;		// iPad
dvTP1_Receiver1 			= 10001:2:0;
dvTP1_CableBox				= 10001:3:0;
dvTP1_CableBoxChannels			= 10001:4:0;
dvTP1_AppleTv 				= 10001:5:0;
dvTP1_Bluray 				= 10001:6:0;
dvTP1_Celia				= 10001:7:0;

dvTP1_TP_Zones				= 10001:10:0;

// Modules
vdvWeather				= 33001:1:0;
vdvAppleTV				= 33002:1:0;
vdvSonos 				= 33003:1:0;
//vdvBluray				= 33004:1:0;

vdvBluray				= 41001:1:0;

(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

PWR_TOGGLE				= 9;
LF					= 10;
CR					= 13;
PWR_ON					= 27;
PWR_OFF					= 28;
DEVICE_ONLINE				= 251;
DATA_INIT				= 252;
PWR					= 255;

// rooms/zones
// First floor
LIVING_ROOM				= 1;
KITCHEN					= 2;
BREAKFAST_AREA				= 3;
GAME_ROOM				= 4;
MUSIC_ROOM				= 5;
FOYER					= 6;
POWDER_ROOM				= 7;
GARAGE					= 8;
SCREENED_PORCH				= 9;
DECK					= 10;
FRONT_DOOR				= 11;
FRONT_YARD				= 12;
LEFT_SIDE_YARD				= 13;
RIGHT_SIDE_YARD				= 14;
BACK_YARD				= 15;
// Second Floor
MASTER_BEDROOM				= 16;
MASTER_BATH				= 17;
HALLWAY					= 18;
GUEST_BATH_ROOM				= 19;
BEDROOM_1				= 20;
BEDROOM_2				= 21;

VOLATILE INTEGER nZone[] = {
    LIVING_ROOM,
    KITCHEN,
    BREAKFAST_AREA,
    GAME_ROOM,
    MUSIC_ROOM,
    FOYER,
    POWDER_ROOM,
    GARAGE,
    SCREENED_PORCH,
    DECK,
    FRONT_DOOR,
    FRONT_YARD,
    LEFT_SIDE_YARD,
    RIGHT_SIDE_YARD,
    BACK_YARD,
    MASTER_BEDROOM,
    MASTER_BATH,
    HALLWAY,
    GUEST_BATH_ROOM,
    BEDROOM_1,
    BEDROOM_2
};

VOLATILE CHAR cZoneNames[21][20] = {
    'Living Room',
    'Kitchen',
    '',
    'Game Room',
    'Music Room',
    'Foyer',
    'Down Stairs Bathroom',
    'Garage',
    'Screened-In Porch',
    'Deck',
    'Front Door',
    'Front Yard',
    'Side Yard - Left',
    'Side Yard - Right',
    'Back Yard',
    'Master Bedroom',
    'Master Bath',
    'Hallway',
    'Guest Bathroom',
    'Guest Bedroom',
    'Massage Room'	// Guest Bedroom 2
};

ZONE_NAME				= 100;

// swipe
SWIPE_UP				= 51;
SWIPE_DOWN				= 52;
SWIPE_LEFT				= 53;
SWIPE_RIGHT				= 54;
SWIPE_ROTATE_LEFT			= 55;
SWIPE_ROTATE_RIGHT			= 56;
SWIPE_SHAKE				= 57;
SWIPE_DOUBLE_TAP			= 58;

VOLATILE INTEGER nSwipeActions[] = {
    SWIPE_UP,
    SWIPE_DOWN,
    SWIPE_LEFT,
    SWIPE_RIGHT,
    SWIPE_ROTATE_LEFT,
    SWIPE_ROTATE_RIGHT,
    SWIPE_SHAKE,
    SWIPE_DOUBLE_TAP
};

LIGHTS_OFF				= 203;
MUSIC_OFF				= 202;
TV_OFF					= 201;
ROOM_OFF				= 200;

VOLATILE INTEGER nShutdown[] = {
    LIGHTS_OFF,
    MUSIC_OFF,
    TV_OFF,
    ROOM_OFF
};

// Sources and Environment Controls
// News sources
SOURCE_WEATHER				= 1;
SOURCE_TRAFFIC_CAMS			= 2;
SOURCE_NEWS				= 3;
// Video Sources
SOURCE_VIDEO				= 4;
SOURCE_CABLE_TV				= 5;
SOURCE_DVR				= 6;
SOURCE_BLURAY				= 7;
SOURCE_APPLETV				= 8;
SOURCE_AUX				= 9;
// Audio Sources and Intercom
SOURCE_INTERCOM				= 10;
SOURCE_MUSIC				= 11;
SOURCE_RADIO				= 12;
SOURCE_INTERNET_RADIO			= 13;
SOURCE_AIRPLAY				= 14;
// Environmental Controls
CONTROLS_LIGHTS				= 15;
CONTROLS_SECURITY			= 16;
CONTROLS_HVAC				= 17;

MAINTANENCE				= 18;

VOLATILE INTEGER nMenuBarSelection[] = {
    // News sources
    SOURCE_WEATHER,
    SOURCE_TRAFFIC_CAMS,
    SOURCE_NEWS,
    // Video Sources
    0,
    0,
    0,
    0,
    0,
    0,
    // Audio Sources and Intercom
    0,
    0,
    0,
    0,
    0,
    // Environmental Controls
    CONTROLS_LIGHTS,
    CONTROLS_SECURITY,
    CONTROLS_HVAC,
    //
    MAINTANENCE
}

VOLATILE INTEGER nMenuBarInputSelection[] = {
    // News sources
    0,
    0,
    0,
    // Video Sources
    SOURCE_VIDEO,
    SOURCE_CABLE_TV,
    SOURCE_DVR,
    SOURCE_BLURAY,
    SOURCE_APPLETV,
    SOURCE_AUX,
    // Audio Sources and Intercom
    SOURCE_INTERCOM,
    SOURCE_MUSIC,
    SOURCE_RADIO,
    SOURCE_INTERNET_RADIO,
    SOURCE_AIRPLAY,
    // Environmental Controls
    0,
    0,
    0,
    //
    0
}

// page names
VOLATILE CHAR cTPSubpageNames[18][25] = {
    'Weather',
    'Traffic',
    'News',
    '',
    '[Input Controls]TV',
    '',
    '[Input Controls]Bluray',
    '[Input Controls]AppleTv',
    '[Input]Aux',
    '',
    '',
    '',
    '',
    '',
    'Lights',
    'Security',
    'Climate',
    'Maintanence'
}

// input icon names
VOLATILE CHAR cTPInputSubpageNames[18][20] = {
    '',
    '',
    '',
    '',
    '[Input]TV',
    '',
    '[Input]Bluray',
    '[Input]AppleTv',
    '[Input]Aux',
    '',
    '',
    '',
    '',
    '',
    'Lights',
    'Security',
    'Climate',
    'Maintanence'
}

// Generic buttons
_PLAY					= 1
_STOP					= 2
_PAUSE					= 3
_NEXT					= 4
_PREVIOUS				= 5
_SCAN_FWD				= 6
_SCAN_REV				= 7
_POWER					= 9
_0					= 10
_1					= 11
_2					= 12
_3					= 13
_4					= 14
_5					= 15
_6					= 16
_7					= 17
_8					= 18
_9					= 19
_ENTER					= 21
_NEXT_STATION_PRESET			= 22
_PREVIOUS_STATION_PRESET		= 23
_VOL_UP					= 24	// ON/OFF
_VOL_DW					= 25	// ON/OFF
_TOGGLE_MUTE				= 26
_POWER_ON				= 27
_POWER_OFF				= 28
_CYCLE_TUNER_BAND			= 40
_MENU					= 44
_UP					= 45
_DOWN					= 46
_LEFT					= 47
_RIGHT					= 48
_SELECT					= 49	// menu select 
_EXIT					= 50	// NOT DVD EXIT
_SLEEP					= 63
_DIMMER					= 84
_DISPLAY				= 99
_MUTE					= 199
_INCREMENT_STATION			= 225
_DECREMENT_STATION			= 226

// Volume
volatile integer nVolumeBtns[] = {
    _VOL_UP,
    _VOL_DW,
    _TOGGLE_MUTE
};

// TP's
volatile dev dvTP_TouchPanels[] = {
    dvTP1_TP_iPad
};

volatile dev dvTP_AppleTV[] = {
    dvTP1_AppleTV
};

volatile dev dvTP_Bluray[] = {
    dvTP1_Bluray
};

volatile dev dvTP_CableBox[] = {
    dvTP1_CableBox
};

// Tuner buttons
volatile integer nTunerBtns[] = {
    _ENTER,
    _NEXT_STATION_PRESET,
    _PREVIOUS_STATION_PRESET,
    _POWER_ON,
    _POWER_OFF,
    _CYCLE_TUNER_BAND,
    _MENU,
    _UP,
    _DOWN,
    _LEFT,
    _RIGHT,
    _SELECT,
    _EXIT,
    _SLEEP,
    _DIMMER,
    _DISPLAY,
    _INCREMENT_STATION,
    _DECREMENT_STATION
};

// GUI Levels
VOLUME_LEVEL_FAMILY_ROOM		= 1;

// Blu-ray/DVD Buttons in additional to standard media controls
BR_DVD_FUNCTION				= 65
//BR_DVD_SETUP				= 66
BR_DVD_CLEAR				= 80
BR_DVD_LIST				= 86	// HOME Button
BR_DVD_DISPLAY				= 99
BR_DVD_SUBTITLE				= 100
BR_DVD_RETURN				= 104
BR_DVD_TOP_MENU				= 115
BR_DVD_ANGLE				= 117
BR_DVD_TRAY				= 120

volatile integer nBlurayBtns[] = {
    _PLAY,
    _STOP,
    _PAUSE,
    _NEXT,
    _PREVIOUS,
    _SCAN_FWD,
    _SCAN_REV,
    _POWER,
    _ENTER,
    _MENU,
    _UP,
    _DOWN,
    _LEFT,
    _RIGHT,
    _SELECT,
    _EXIT,
    BR_DVD_FUNCTION,
    BR_DVD_CLEAR,
    BR_DVD_LIST,// HOME Button
    BR_DVD_DISPLAY,
    BR_DVD_SUBTITLE,
    BR_DVD_RETURN,
    BR_DVD_TOP_MENU,
    BR_DVD_ANGLE,
    BR_DVD_TRAY
};

// Blu-ray/DVD feedback
BR_DVD_FB_PLAY				= 241
BR_DVD_FB_STOP				= 242
BR_DVD_FB_PAUSE				= 243
BR_DVD_FB_SCAN_FWD			= 246
BR_DVD_FB_SCAN_REV			= 247



// Apple TV
volatile integer nAppleTVBtns[] = {
    1,		// menu
    2,		// menu hold
    3,		// up
    4,		// down
    5,		// select
    6,		// left
    7,		// right
    10,		// play/pause
    15,		// pause
    16,		// play
    17,		// stop
    18,		// fast forward
    19,		// rewind
    20,		// chapter forward
    21, 	// chapter backwards
    22		// list/select hold
};

// cablebox
STB_PLAY				= 1;
STB_STOP				= 2;
STB_PAUSE				= 3;
STB_FASTFORWARD				= 4;
STB_REWIND				= 5;
STB_RECORD				= 8;
STB_0					= 10;
STB_1					= 11;
STB_2					= 12;
STB_3					= 13;
STB_4					= 14;
STB_5					= 15;
STB_6					= 16;
STB_7					= 17;
STB_8					= 18;
STB_9					= 19;
STB_OK					= 21;
STB_CHANNEL_UP				= 22;
STB_CHANNEL_DOWN			= 23;
STB_ON_DEMAND				= 43;
STB_GUIDE				= 44;
STB_MENU				= 45;
STB_INFO				= 46;
STB_EXIT				= 47;
STB_SETTINGS				= 48;
STB_UP					= 49;
STB_DOWN				= 50;
STB_LEFT				= 51;
STB_RIGHT				= 52;
STB_PAGE_UP				= 53;
STB_PAGE_DOWN				= 54;
STB_A					= 55;
STB_B					= 56;
STB_C					= 57;
STB_D					= 58;
STB_LAST				= 59;
STB_FAVORITE				= 60;
STB_GUIDE_PREV_DAY			= 61;
STB_GUIDE_NEXT_DAY			= 62;
STB_M1					= 63;
STB_M2					= 64;
STB_M3					= 65;
STB_GO_BACK				= 66;
STB_DVR_LIST				= 67;
STB_DVR_LIVE				= 68;
STB_ASTERIK				= 69;	// *
STB_AMPERSIGN				= 70; 	// #

STB_CLEAR				= 9;
STB_ENTER				= 20;

STB_CURRENT_CHANNEL_NUM			= 1;
STB_CURRENT_CHANNEL_NAME		= 2;
STB_CURRENT_CHANNEL_IMAGE		= 3;
STB_TEMP_CHANNEL_NUM			= 4;

volatile integer nCableBoxBtns[] = {
    STB_PLAY,
    STB_STOP,
    STB_PAUSE,
    STB_FASTFORWARD,
    STB_REWIND,
    STB_RECORD,
    STB_0,
    STB_1,
    STB_2,
    STB_3,
    STB_4,
    STB_5,
    STB_6,
    STB_7,
    STB_8,
    STB_9,
    STB_OK,
    STB_CHANNEL_UP,
    STB_CHANNEL_DOWN,
    STB_ON_DEMAND,
    STB_GUIDE,
    STB_MENU,
    STB_INFO,
    STB_EXIT,
    STB_SETTINGS,
    STB_UP,
    STB_DOWN,
    STB_LEFT,
    STB_RIGHT,
    STB_PAGE_UP,
    STB_PAGE_DOWN,
    STB_A,
    STB_B,
    STB_C,
    STB_D,	
    STB_LAST,
    STB_FAVORITE,
    STB_GUIDE_PREV_DAY,
    STB_GUIDE_NEXT_DAY,
    STB_M1,
    STB_M2,
    STB_M3,
    STB_GO_BACK,
    STB_DVR_LIST,
    STB_DVR_LIVE,
    STB_ASTERIK,
    STB_AMPERSIGN
};

// CATV favorites/presets 
volatile integer nCableBoxPresetBtns[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};

// TV Channels - (From http://www.metrocast.com/channel_lineup.cfm)
CH2_ABC_WMAR_BALTIMORE			= 2;
CH3_PBS_WETA_DC				= 3;
CH4_NBC_WRC_DC				= 4;
CH5_FOX_WTTG_DC				= 5;
CH6_MY20_WDCA_DC			= 6;
CH7_ABC_WJLA_DC				= 7;
CH8_CW_WDCW_DC				= 8;
CH9_CBS_WUSA_DC				= 9;
CH10_METROCAST_LOCAL			= 10;
CH12_ION_WPXW_DC			= 12;
CH15_QVC				= 15;
CH16_CSPAN				= 16;
CH17_HSN				= 17;
CH18_CSPAN2				= 18;
CH20_EWTN				= 20;
CH21_TBN				= 21;
CH22_PBS_WMPT_ANNAPOLIS			= 22;
CH23_ESPN				= 23;
CH24_ESPN2				= 24;
CH25_COMCAST_SPORTSNET_PLUS		= 25;
CH26_COMCAST_SPORTSNET			= 26;
CH27_SPEED				= 27;
CH28_NBC_SPORTS_NETWORK			= 28;
CH29_MASN			 	= 29;
CH30_MASN2				= 30;
CH32_OUTDOOR_CHANNEL			= 32;
CH34_CNN				= 34;
CH35_HLN				= 35;
CH36_CNBC				= 36;
CH37_THE_WEATHER_CHANNEL		= 37;
CH38_FOX_NEWS				= 38;
CH39_MSNBC				= 39;
CH40_PENTAGON_CHANNEL			= 40;
CH41_USA				= 41;
CH42_ABC_FAMILY				= 42;
CH43_HALLMARK_CHANNEL			= 43;
CH44_HALLMARK_MOVIE_CHANNEL		= 44;
CH45_TBS				= 45;
CH46_TV_LAND				= 46;
CH47_TNT				= 47;
CH48_A_AND_E				= 48;		// A&E
CH49_SYFY				= 49;
CH50_NICKELODEON			= 50;
CH51_CARTOON_NETWORK			= 51;
CH52_DISNEY_CHANNEL			= 52;
CH53_DISCOVERY_CHANNEL			= 53;
CH54_TRAVEL_CHANNEL			= 54;
CH55_ANIMAL_PLANET			= 55;
CH56_NATIONAL_GEOGRAPHIC		= 56;
CH57_HISTORY				= 57;
CH58_TRU_TV				= 58;
CH59_BRAVO				= 59;
CH60_LIFETIME				= 60;
CH61_LMN				= 61;
CH62_DISNEY_JUNIOR			= 62;
CH63_E					= 63;		// E!
CH64_FOOD_NETWORK			= 64;
CH65_HGTV				= 65;
CH66_TLC				= 66;
CH67_AMC				= 67;
CH68_TURNER_CLASSIC_MOVIES		= 68;
CH69_FX_MOVIE_NETWORK			= 69;
CH70_FX					= 70;
CH71_SPIKE				= 71;
CH72_COMEDY_CENTRAL			= 72;
CH73_GAC				= 73;
CH74_OXYGEN				= 74;
CH75_BET				= 75;
CH76_MTV				= 76;
CH77_VH1				= 77;
CH78_CMT				= 78;
CH79_JEWELRY_TV				= 79;
CH95_GOVERNMENT_LOCAL			= 95;
CH96_EDUCATIONAL_LOCAL			= 96;
CH97_ZAP2IT_GUIDE			= 97;
CH98_EDUCATIONAL_CSM			= 98;
//CH100_THE_HUB				= 100;
//CH101_NICKTOONS			= 101;
//CH102_SPROUT				= 102;
//CH103_NICK_JR				= 103;
//CH104_DISNEY_XD			= 104;
//CH105_TEEN_NICK			= 105;
//CH106_BOOMERANG			= 106;
CH107_WETA_FAMILY_DC			= 107;
CH108_WETA_UK_DC			= 108;
//CH109_TV_ONE				= 109;
//CH110_MOVIEPLEX			= 110;
//CH111_CHILLER				= 111;
//CH114_NAT_GEO_WILD			= 114;
//CH115_INVESTIGATIN_DISCOVERY		= 115;
//CH116_BBC_AMERICA			= 116;
//CH117_BLOOMBERG			= 117;
//CH119_BIOGRAPHY			= 119;
//CH120_H2				= 120;
//CH121_SCIENCE				= 121;
//CH122_MILITARY_CHANNEL		= 122;
CH123_NBC_WRC_COZI_TV_DC		= 123;
CH124_WUSA_WEATHER_RADAR_DC		= 124;
CH125_WDCW_ANTENNA_TV_DC		= 125;
CH126_WDCW_THIS_TV_DC			= 126;
CH127_WJLA_LIVE_WELL_NETWORK_DC		= 127;
CH128_WJLA_METV_DC			= 128;
//CH130_OWN				= 130;
//CH131_DESTINATION_AMERICA		= 131;
//CH132_REELZ_CHANNEL			= 132;
//CH134_LIFETIME_REAL_WOMEN		= 134;
//CH136_STYLE				= 136;
//CH140_GSN				= 140;
//CH141_HRTV				= 141;
//CH142_ESPNU				= 142;
//CH143_NFL_NETWORK			= 143;
//CH144_MLB_NETWORK			= 144;
//CH145_GOLF_CHANNEL			= 145;
//CH146_G4				= 146;
//CH147_FOX_BUSINESS_NETWORK		= 147;
//CH148_FOX_SOCCER			= 148;
//CH149_CBS_SPORTS_NETWORK		= 149;
//CH151_MTV2				= 151;
//CH152_MTV_HITS			= 152;
//CH153_VH1_CLASSIC			= 153;
//CH154_VH1_SOUL			= 154;
//CH155_CMT_PURE_COUNTRY		= 155;
//CH156_UP				= 156;
//CH158_THE_WORD_NETWORK		= 158;
//CH200_DISCOVERY_FIT_AND_HEALTH	= 200;
//CH201_DIY				= 201;
//CH202_COOKING_CHANNEL			= 202;
//CH203_WE				= 203;
//CH204_FUSE				= 204;
//CH209_NFL_REDZONE			= 209;
//CH210_ESPNEWS				= 210;
//CH211_ESPN_CLASSIC			= 211;
//CH212_YES_NATIONAL			= 212;
//CH214_FOX_COLLEGE_SPORTS_ATLANTIC	= 214;
//CH215_FOX_COLLEGE_SPORTS_CENTRAL	= 215;
//CH216_FOX_COLLEGE_SPORTS_PACIFIC	= 216;
//CH217_FUEL_TV				= 217;
//CH270_INDEPENDENT_FILM_CHANNEL	= 270;
//CH300_HBO				= 300;
//CH301_HBO2				= 301;
//CH302_HBO_SIGNATURE			= 302;
//CH303_HBO_FAMILY			= 303;
//CH304_HBO_COMEDY			= 304;
//CH305_HBO_ZONE			= 305;
//CH325_HBO_HD				= 325;
//CH350_CINEMAX				= 350;
//CH351_MOREMAX				= 351;
//CH352_ACTIONMAX			= 352;
//CH353_THRILLERMAX			= 353;
//CH375_CINEMAX_HD			= 375;
//CH400_SHOWTIME			= 400;
//CH401_SHOWTIME2			= 401;
//CH402_SHOWTIME_SHOWCASE		= 402;
//CH403_SHOWTIME_EXTREME		= 403;
//CH404_SHOWTIME_WOMEN			= 404;
//CH405_SHOWTIME_FAMILY_ZONE		= 405;
//CH406_SHOWTIME_NEXT			= 406;
//CH407_THE_MOVIE_CHANNEL		= 407;
//CH408_THE_MOVIE_CHANNEL_XTRA		= 408;
//CH409_FLIX				= 409;
//CH425_SHOWTIME_HD			= 425;
//CH450_STARZ				= 450;
//CH451_STARZ_EDGE			= 451;
//CH452_STARZ_IN_BLACK			= 452;
//CH453_STARZ_KIDS_AND_FAMILY		= 453;
//CH454_STARZ_CINEMA			= 454;
//CH455_STARZ_COMEDY			= 455;
//CH456_ENCORE				= 456;
//CH457_ENCORE_ACTION			= 457;
//CH458_ENCORE_DRAMA			= 458;
//CH459_ENCORE_LOVE			= 459;
//CH460_ENCORE_SUSPENSE			= 460;
//CH461_ENCORE_WESTERNS			= 461;
//CH462_ENCORE_FAMILY			= 462;
//CH475_STARZ_HD			= 475;
CH702_ABC_WMAR_HD_BALTIMORE		= 702;
CH703_PBS_WETA_HD_DC			= 703;
CH704_NBC_WRC_HD_DC			= 704;
CH705_FOX_WTTG_HD_DC			= 705;
CH706_MY20_WDCA_HD_DC			= 706;
CH707_ABC_WJLA_HD_DC			= 707;
CH709_CBS_WUSA_HD_DC			= 709;
CH715_QVC_HD				= 715;
CH723_ESPN_HD				= 723;
CH724_ESPN2_HD				= 724;
CH725_COMCAST_SPORTSNET_PLUS_HD		= 725;
CH726_COMCAST_SPORTSNET_HD		= 726;
CH727_SPEED_HD				= 727;
CH728_NBC_SPORTS_NETWORK_HD		= 728;
CH729_MASN_HD			 	= 729;
//CH730_GOLF_CHANNEL_HD			= 730;
CH732_OUTDOOR_CHANNEL_HD		= 732;
CH734_CNN_HD				= 734;
CH737_THE_WEATHER_CHANNEL_HD		= 737;
CH738_FOX_NEWS_HD			= 738;
//CH741_UNIVERSAL_HD			= 741;
CH742_ABC_FAMILY_HD			= 742;
CH745_TBS_HD				= 745;
CH747_TNT_HD				= 747;
CH748_A_AND_E_HD			= 748;		// A&E
CH749_SYFY_HD				= 749;
CH752_DISNEY_CHANNEL_HD			= 752;
CH753_DISCOVERY_CHANNEL_HD		= 753;
CH755_ANIMAL_PLANET_HD			= 755;
CH756_NATIONAL_GEOGRAPHIC_HD		= 756;
CH757_HISTORY_HD			= 757;
CH759_BRAVO_HD				= 759;
CH760_LIFETIME_HD			= 760;
CH761_LMN_HD				= 761;
CH763_E_HD				= 763;		// E!
CH764_FOOD_NETWORK_HD			= 764;
CH765_HGTV_HD				= 765;
CH766_TLC_HD				= 766;
CH767_AMC_HD				= 767;
CH770_FX_HD				= 770;
CH774_OXYGEN_HD				= 774;
CH780_VELOCITY_HD			= 780;
//CH781_PALLADIA_HD			= 781;
CH782_USA_HD				= 782;
//CH783_MGM_HD				= 783;
//CH784_SCIENCE_HD			= 784;
//CH785_NFL_NETWORK_HD			= 785;
//CH786_DESINATION_AMERICA_HD		= 786;
//CH787_NFL_REDZONE_HD			= 787;
CH800_INDEMAND_MOVIES_AND_EVENTS_1	= 800;
CH801_INDEMAND_MOVIES_AND_EVENTS_2	= 801;
CH802_INDEMAND_MOVIES_AND_EVENTS_3	= 802;
CH803_INDEMAND_MOVIES_AND_EVENTS_4	= 803;
CH804_INDEMAND_MOVIES_AND_EVENTS_5	= 804;
CH805_INDEMAND_MOVIES_AND_EVENTS_6	= 805;
CH806_INDEMAND_MOVIES_AND_EVENTS_7	= 806;
//CH899_ADULT_PAY_PER_VIEW		= 899;
CH903_MUSIC_HIT_LIST			= 903;
CH904_MUSIC_HIP_HOP_AND_R_AND_B		= 904;
CH905_MUSIC_MC_UNIVERSITY		= 905;
CH906_MUSIC_DANCE_ELECTRONICA		= 906;
CH907_MUSIC_RAP				= 907;
CH908_MUSIC_HIPHOP_CLASSICS		= 908;
CH909_MUSIC_THROWBACK_JAMZ		= 909;
CH910_MUSIC_R_AND_B_CLASSICS		= 910;
CH911_MUSIC_R_AND_B_SOUL		= 911;
CH912_MUSIC_GOSPEL			= 912;
CH913_MUSIC_REGGE			= 913;
CH914_MUSIC_CLASSIC_ROCK		= 914;
CH915_MUSIC_RETRO_ROCK			= 915;
CH916_MUSIC_ROCK			= 916;
CH917_MUSIC_METAL			= 917;
CH918_MUSIC_ALTERNATIVE			= 918;
CH919_MUSIC_CLASSIC_ALTERNATIVE		= 919;
CH920_MUSIC_ADULT_ALTERNATIVE		= 920;
CH921_MUSIC_SOFT_ROCK			= 921;
CH922_MUSIC_POP_HITS			= 922;
CH923_MUSIC_90S				= 923;
CH924_MUSIC_80S				= 924;
CH925_MUSIC_70S				= 925;
CH926_MUSIC_SOLID_GOLD_OLDIES		= 926;
CH927_MUSIC_PARTY_FAVORITES		= 927;
CH928_MUSIC_STAGE_AND_SCREEN		= 928;
CH929_MUSIC_KIDZ_ONLY			= 929;
CH930_MUSIC_TODDLER_TUNES		= 930;
CH931_MUSIC_TODAYS_COUNTRY		= 931;
CH932_MUSIC_TRUE_COUNTRY		= 932;
CH933_MUSIC_CLASSIC_COUNTRY		= 933;
CH934_MUSIC_CONTEMPORARY_CHRISTIAN	= 934;
CH935_MUSIC_SOUNDS_OF_THE_SEASON	= 935;
CH936_MUSIC_SOUNDSCAPE			= 936;
CH937_MUSIC_SMOOTH_JAZZ			= 937;
CH938_MUSIC_JAZZ			= 938;
CH939_MUSIC_BLUES			= 939;
CH940_MUSIC_SINGERS_AND_SWING		= 940;
CH941_MUSIC_EASY_LISTENING		= 941;
CH942_MUSIC_CLASSICAL_MASTERPIECES	= 942;
CH943_MUSIC_LIGHT_CLASSICAL		= 943;
CH944_MUSIC_MUSICA_URBANA		= 944;
CH945_MUSIC_POP_LATINO			= 945;
CH946_MUSIC_TROPICALES			= 946;
CH947_MUSIC_MEXICANA			= 947;
CH948_MUSIC_ROMANCES			= 948;
CH999_METROCAST_ON_DEMAND		= 999;

volatile integer nCableBoxTVChannelBtns[] = {
    CH2_ABC_WMAR_BALTIMORE,
    CH3_PBS_WETA_DC,
    CH4_NBC_WRC_DC,
    CH5_FOX_WTTG_DC,
    CH6_MY20_WDCA_DC,
    CH7_ABC_WJLA_DC,
    CH8_CW_WDCW_DC,
    CH9_CBS_WUSA_DC,
    CH10_METROCAST_LOCAL,
    CH12_ION_WPXW_DC,
    CH15_QVC,
    CH16_CSPAN,
    CH17_HSN,
    CH18_CSPAN2,
    CH20_EWTN,
    CH21_TBN,
    CH22_PBS_WMPT_ANNAPOLIS,
    CH23_ESPN,
    CH24_ESPN2,
    CH25_COMCAST_SPORTSNET_PLUS,
    CH26_COMCAST_SPORTSNET,
    CH27_SPEED,
    CH28_NBC_SPORTS_NETWORK,
    CH29_MASN,
    CH30_MASN2,
    CH32_OUTDOOR_CHANNEL,
    CH34_CNN,
    CH35_HLN,
    CH36_CNBC,
    CH37_THE_WEATHER_CHANNEL,
    CH38_FOX_NEWS,
    CH39_MSNBC,
    CH40_PENTAGON_CHANNEL,
    CH41_USA,
    CH42_ABC_FAMILY,
    CH43_HALLMARK_CHANNEL,
    CH44_HALLMARK_MOVIE_CHANNEL,
    CH45_TBS,
    CH46_TV_LAND,
    CH47_TNT,
    CH48_A_AND_E,
    CH49_SYFY,
    CH50_NICKELODEON,
    CH51_CARTOON_NETWORK,
    CH52_DISNEY_CHANNEL,
    CH53_DISCOVERY_CHANNEL,
    CH54_TRAVEL_CHANNEL,
    CH55_ANIMAL_PLANET,
    CH56_NATIONAL_GEOGRAPHIC,
    CH57_HISTORY,
    CH58_TRU_TV,
    CH59_BRAVO,
    CH60_LIFETIME,
    CH61_LMN,
    CH62_DISNEY_JUNIOR,
    CH63_E,
    CH64_FOOD_NETWORK,
    CH65_HGTV,
    CH66_TLC,
    CH67_AMC,
    CH68_TURNER_CLASSIC_MOVIES,
    CH69_FX_MOVIE_NETWORK,
    CH70_FX,
    CH71_SPIKE,
    CH72_COMEDY_CENTRAL,
    CH73_GAC,
    CH74_OXYGEN,
    CH75_BET,
    CH76_MTV,
    CH77_VH1,
    CH78_CMT,
    CH79_JEWELRY_TV,
    CH95_GOVERNMENT_LOCAL,
    CH96_EDUCATIONAL_LOCAL,
    CH97_ZAP2IT_GUIDE,
    CH98_EDUCATIONAL_CSM,
    //CH100_THE_HUB,
    //CH101_NICKTOONS,
    //CH102_SPROUT,
    //CH103_NICK_JR,
    //CH104_DISNEY_XD,
    //CH105_TEEN_NICK,
    //CH106_BOOMERANG,
    CH107_WETA_FAMILY_DC,
    CH108_WETA_UK_DC,
    //CH109_TV_ONE,
    //CH110_MOVIEPLEX,
    //CH111_CHILLER,
    //CH114_NAT_GEO_WILD,
    //CH115_INVESTIGATIN_DISCOVERY,
    //CH116_BBC_AMERICA,
    //CH117_BLOOMBERG,
    //CH119_BIOGRAPHY,
    //CH120_H2,
    //CH121_SCIENCE,
    //CH122_MILITARY_CHANNEL,
    CH123_NBC_WRC_COZI_TV_DC,
    CH124_WUSA_WEATHER_RADAR_DC,
    CH125_WDCW_ANTENNA_TV_DC,
    CH126_WDCW_THIS_TV_DC,
    CH127_WJLA_LIVE_WELL_NETWORK_DC,
    CH128_WJLA_METV_DC,
    //CH130_OWN,
    //CH131_DESTINATION_AMERICA,
    //CH132_REELZ_CHANNEL,
    //CH134_LIFETIME_REAL_WOMEN,
    //CH136_STYLE,
    //CH140_GSN,
    //CH141_HRTV,
    //CH142_ESPNU,
    //CH143_NFL_NETWORK,
    //CH144_MLB_NETWORK,
    //CH145_GOLF_CHANNEL,
    //CH146_G4,
    //CH147_FOX_BUSINESS_NETWORK,
    //CH148_FOX_SOCCER,
    //CH149_CBS_SPORTS_NETWORK,
    //CH151_MTV2,
    //CH152_MTV_HITS,
    //CH153_VH1_CLASSIC,
    //CH154_VH1_SOUL,
    //CH155_CMT_PURE_COUNTRY,
    //CH156_UP,
    //CH158_THE_WORD_NETWORK,
    //CH200_DISCOVERY_FIT_AND_HEALTH,
    //CH201_DIY,
    //CH202_COOKING_CHANNEL,
    //CH203_WE,
    //CH204_FUSE,
    //CH209_NFL_REDZONE,
    //CH210_ESPNEWS,
    //CH211_ESPN_CLASSIC,
    //CH212_YES_NATIONAL,
    //CH214_FOX_COLLEGE_SPORTS_ATLANTIC,
    //CH215_FOX_COLLEGE_SPORTS_CENTRAL,
    //CH216_FOX_COLLEGE_SPORTS_PACIFIC,
    //CH217_FUEL_TV,
    //CH270_INDEPENDENT_FILM_CHANNEL,
    //CH300_HBO,
    //CH301_HBO2,
    //CH302_HBO_SIGNATURE,
    //CH303_HBO_FAMILY,
    //CH304_HBO_COMEDY,
    //CH305_HBO_ZONE,
    //CH325_HBO_HD,
    //CH350_CINEMAX,
    //CH351_MOREMAX,
    //CH352_ACTIONMAX,
    //CH353_THRILLERMAX,
    //CH375_CINEMAX_HD,
    //CH400_SHOWTIME,
    //CH401_SHOWTIME2,
    //CH402_SHOWTIME_SHOWCASE,
    //CH403_SHOWTIME_EXTREME,
    //CH404_SHOWTIME_WOMEN,
    //CH405_SHOWTIME_FAMILY_ZONE,
    //CH406_SHOWTIME_NEXT,
    //CH407_THE_MOVIE_CHANNEL,
    //CH408_THE_MOVIE_CHANNEL_XTRA,
    //CH409_FLIX,
    //CH425_SHOWTIME_HD,
    //CH450_STARZ,
    //CH451_STARZ_EDGE,
    //CH452_STARZ_IN_BLACK,
    //CH453_STARZ_KIDS_AND_FAMILY,
    //CH454_STARZ_CINEMA,
    //CH455_STARZ_COMEDY,
    //CH456_ENCORE,
    //CH457_ENCORE_ACTION,
    //CH458_ENCORE_DRAMA,
    //CH459_ENCORE_LOVE,
    //CH460_ENCORE_SUSPENSE,
    //CH461_ENCORE_WESTERNS,
    //CH462_ENCORE_FAMILY,
    //CH475_STARZ_HD,
    CH702_ABC_WMAR_HD_BALTIMORE,
    CH703_PBS_WETA_HD_DC,
    CH704_NBC_WRC_HD_DC,
    CH705_FOX_WTTG_HD_DC,
    CH706_MY20_WDCA_HD_DC,
    CH707_ABC_WJLA_HD_DC,
    CH709_CBS_WUSA_HD_DC,
    CH715_QVC_HD,
    CH723_ESPN_HD,
    CH724_ESPN2_HD,
    CH725_COMCAST_SPORTSNET_PLUS_HD,
    CH726_COMCAST_SPORTSNET_HD,
    CH727_SPEED_HD,
    CH728_NBC_SPORTS_NETWORK_HD,
    CH729_MASN_HD,
    //CH730_GOLF_CHANNEL_HD,
    CH732_OUTDOOR_CHANNEL_HD,
    CH734_CNN_HD,
    CH737_THE_WEATHER_CHANNEL_HD,
    CH738_FOX_NEWS_HD,
    //CH741_UNIVERSAL_HD,
    CH742_ABC_FAMILY_HD,
    CH745_TBS_HD,
    CH747_TNT_HD,
    CH748_A_AND_E_HD,
    CH749_SYFY_HD,
    CH752_DISNEY_CHANNEL_HD,
    CH753_DISCOVERY_CHANNEL_HD,
    CH755_ANIMAL_PLANET_HD,
    CH756_NATIONAL_GEOGRAPHIC_HD,
    CH757_HISTORY_HD,
    CH759_BRAVO_HD,
    CH760_LIFETIME_HD,
    CH761_LMN_HD,
    CH763_E_HD,
    CH764_FOOD_NETWORK_HD,
    CH765_HGTV_HD,
    CH766_TLC_HD,
    CH767_AMC_HD,
    CH770_FX_HD,
    CH774_OXYGEN_HD,
    CH780_VELOCITY_HD,
    //CH781_PALLADIA_HD,
    CH782_USA_HD,
    //CH783_MGM_HD,
    //CH784_SCIENCE_HD,
    //CH785_NFL_NETWORK_HD,
    //CH786_DESINATION_AMERICA_HD,
    //CH787_NFL_REDZONE_HD,
    CH800_INDEMAND_MOVIES_AND_EVENTS_1,
    CH801_INDEMAND_MOVIES_AND_EVENTS_2,
    CH802_INDEMAND_MOVIES_AND_EVENTS_3,
    CH803_INDEMAND_MOVIES_AND_EVENTS_4,
    CH804_INDEMAND_MOVIES_AND_EVENTS_5,
    CH805_INDEMAND_MOVIES_AND_EVENTS_6,
    CH806_INDEMAND_MOVIES_AND_EVENTS_7,
    //CH899_ADULT_PAY_PER_VIEW,
    CH903_MUSIC_HIT_LIST,
    CH904_MUSIC_HIP_HOP_AND_R_AND_B,
    CH905_MUSIC_MC_UNIVERSITY,
    CH906_MUSIC_DANCE_ELECTRONICA,
    CH907_MUSIC_RAP,
    CH908_MUSIC_HIPHOP_CLASSICS,
    CH909_MUSIC_THROWBACK_JAMZ,
    CH910_MUSIC_R_AND_B_CLASSICS,
    CH911_MUSIC_R_AND_B_SOUL,
    CH912_MUSIC_GOSPEL,
    CH913_MUSIC_REGGE,
    CH914_MUSIC_CLASSIC_ROCK,
    CH915_MUSIC_RETRO_ROCK,
    CH916_MUSIC_ROCK,
    CH917_MUSIC_METAL,
    CH918_MUSIC_ALTERNATIVE,
    CH919_MUSIC_CLASSIC_ALTERNATIVE,
    CH920_MUSIC_ADULT_ALTERNATIVE,
    CH921_MUSIC_SOFT_ROCK,
    CH922_MUSIC_POP_HITS,
    CH923_MUSIC_90S,
    CH924_MUSIC_80S,
    CH925_MUSIC_70S,
    CH926_MUSIC_SOLID_GOLD_OLDIES,
    CH927_MUSIC_PARTY_FAVORITES,
    CH928_MUSIC_STAGE_AND_SCREEN,
    CH929_MUSIC_KIDZ_ONLY,
    CH930_MUSIC_TODDLER_TUNES,
    CH931_MUSIC_TODAYS_COUNTRY,
    CH932_MUSIC_TRUE_COUNTRY,
    CH933_MUSIC_CLASSIC_COUNTRY,
    CH934_MUSIC_CONTEMPORARY_CHRISTIAN,
    CH935_MUSIC_SOUNDS_OF_THE_SEASON,
    CH936_MUSIC_SOUNDSCAPE,
    CH937_MUSIC_SMOOTH_JAZZ,
    CH938_MUSIC_JAZZ,
    CH939_MUSIC_BLUES,
    CH940_MUSIC_SINGERS_AND_SWING,
    CH941_MUSIC_EASY_LISTENING,
    CH942_MUSIC_CLASSICAL_MASTERPIECES,
    CH943_MUSIC_LIGHT_CLASSICAL,
    CH944_MUSIC_MUSICA_URBANA,
    CH945_MUSIC_POP_LATINO,
    CH946_MUSIC_TROPICALES,
    CH947_MUSIC_MEXICANA,
    CH948_MUSIC_ROMANCES,
    CH999_METROCAST_ON_DEMAND
};

volatile char cCableBoxTVChannelNames[279][30] = {
    {'WMAR (ABC), Baltimore'},
    {'WETA (PBS), WDC'},
    {'WRC (NBC), WDC'},
    {'WTTG (FOX), WDC'},
    {'WDCA (My 20), WDC'},
    {'WJLA (ABC), WDC'},
    {'WDCW (CW), WDC'},
    {'WUSA (CBS), WDC'},
    {'MetroCast Channel 10'},
    {'WPXW (ION), WDC'},
    {'QVC'},
    {'C-SPAN'},
    {'HSN'},
    {'C-SPAN 2'},
    {'EWTN'},
    {'TBN'},
    {'WMPT (PBS), Annapolis'},
    {'ESPN'},
    {'ESPN2'},
    {'Comcast SportsNet Plus'},
    {'Comcast SportsNet'},
    {'Speed'},
    {'NBC Sports Network'},
    {'MASN'},
    {'MASN 2'},
    {'Outdoor Channel'},
    {'CNN'},
    {'HLN'},
    {'CNBC'},
    {'The Weather Channel'},
    {'Fox News'},
    {'MSNBC'},
    {'Pentagon Channel'},
    {'USA'},
    {'ABC Family'},
    {'Hallmark Channel'},
    {'Hallmark Movie Channel'},
    {'TBS'},
    {'TV Land'},
    {'TNT'},
    {'A&E'},
    {'Syfy'},
    {'Nickelodeon'},
    {'Cartoon Network'},
    {'Disney Channel'},
    {'Discovery Channel'},
    {'Travel Channel'},
    {'Animal Planet'},
    {'National Geographic'},
    {'History'},
    {'truTV'},
    {'Bravo'},
    {'Lifetime'},
    {'LMN'},
    {'Disney Junior'},
    {'E! '},
    {'Food Network'},
    {'HGTV'},
    {'TLC'},
    {'AMC'},
    {'Turner Classic Movies '},
    {'FX Movie Channel'},
    {'FX'},
    {'Spike'},
    {'Comedy Central'},
    {'GAC'},
    {'Oxygen'},
    {'BET'},
    {'MTV'},
    {'VH1'},
    {'CMT'},
    {'Jewelry TV'},
    {'Government Access'},
    {'Educational Access'},
    {'Zap2it Channel Guide'},
    {'Educational Access-CSM'},
    //{'The Hub'},
    //{'Nicktoons'},
    //{'Sprout'},
    //{'Nick Jr.'},
    //{'Disney XD'},
    //{'TeenNick'},
    //{'Boomerang'},
    {'WETA Family, WDC'},
    {'WETA UK, WDC'},
    //{'TV One'},
    //{'MoviePlex'},
    //{'Chiller'},
    //{'Nat Geo Wild'},
    //{'Investigation Discovery'},
    //{'BBC America'},
    //{'Bloomberg'},
    //{'Biography'},
    //{'H2'},
    //{'Science'},
    //{'Military Channel'},
    {'WRC Cozi TV (NBC), WDC'},
    {'WUSA Weather Radar, WDC'},
    {'WDCW Antenna TV, WDC '},
    {'WDCW This TV, WDC '},
    {'WJLA Live Well Network, WDC'},
    {'WJLA MeTV, WDC'},
    //{'OWN'},
    //{'Destination America'},
    //{'Reelz Channel'},
    //{'Lifetime Real Women'},
    //{'Style'},
    //{'GSN'},
    //{'HRTV'},
    //{'ESPNU'},
    //{'NFL Network'},
    //{'MLB Network'},
    //{'Golf Channel'},
    //{'G4'},
    //{'Fox Business Network'},
    //{'Fox Soccer'},
    //{'CBS Sports Network'},
    //{'MTV2'},
    //{'MTV Hits'},
    //{'VH1 Classic'},
    //{'VH1 Soul'},
    //{'CMT Pure Country'},
    //{'UP'},
    //{'The Word Network'},
    //{'Discovery Fit & Health'},
    //{'DIY'},
    //{'Cooking Channel'},
    //{'WE'},
    //{'fuse'},
    //{'NFL RedZone'},
    //{'ESPNews'},
    //{'ESPN Classic'},
    //{'YES National'},
    //{'Fox College Sports (Atlantic)'},
    //{'Fox College Sports (Central)'},
    //{'Fox College Sports (Pacific)'},
    //{'Fuel TV'},
    //{'Independent Film Channel'},
    //{'HBO'},
    //{'HBO 2'},
    //{'HBO Signature'},
    //{'HBO Family'},
    //{'HBO Comedy'},
    //{'HBO Zone'},
    //{'HBO HD'},
    //{'Cinemax'},
    //{'MoreMAX'},
    //{'ActionMAX'},
    //{'ThrillerMAX'},
    //{'Cinemax HD'},
    //{'Showtime'},
    //{'Showtime 2'},
    //{'Showtime Showcase'},
    //{'Showtime Extreme'},
    //{'Showtime Women'},
    //{'Showtime Family Zone'},
    //{'Showtime Next'},
    //{'The Movie Channel'},
    //{'The Movie Channel Xtra'},
    //{'Flix'},
    //{'Showtime HD'},
    //{'Starz'},
    //{'Starz Edge'},
    //{'Starz In Black'},
    //{'Starz Kids & Family'},
    //{'Starz Cinema'},
    //{'Starz Comedy'},
    //{'Encore'},
    //{'Encore Action'},
    //{'Encore Drama'},
    //{'Encore Love'},
    //{'Encore Suspense'},
    //{'Encore Westerns'},
    //{'Encore Family'},
    //{'Starz HD'},
    {'WMAR HD (ABC), Baltimore'},
    {'WETA HD (PBS), WDC'},
    {'WRC HD (NBC), WDC'},
    {'WTTG HD (FOX), WDC'},
    {'WDCA HD (My 20), WDC'},
    {'WJLA HD (ABC), WDC'},
    {'WUSA HD (CBS), WDC'},
    {'QVC HD'},
    {'ESPN HD'},
    {'ESPN2 HD'},
    {'Comcast SportsNet Plus HD'},
    {'Comcast SportsNet HD'},
    {'Speed HD'},
    {'NBC Sports Network HD'},
    {'MASN HD'},
    //{'Golf Channel HD'},
    {'Outdoor Channel HD'},
    {'CNN HD'},
    {'The Weather Channel HD'},
    {'Fox News HD'},
    //{'Universal HD'},
    {'ABC Family HD'},
    {'TBS HD'},
    {'TNT HD'},
    {'A&E HD'},
    {'Syfy HD'},
    {'Disney Channel HD'},
    {'Discovery Channel HD'},
    {'Animal Planet HD'},
    {'National Geographic HD'},
    {'History HD'},
    {'Bravo HD'},
    {'Lifetime HD'},
    {'LMN HD'},
    {'E! HD'},
    {'Food Network HD'},
    {'HGTV HD'},
    {'TLC HD'},
    {'AMC HD'},
    {'FX HD'},
    {'Oxygen HD'},
    {'Velocity HD'},
    //{'Palladia HD'},
    {'USA HD'},
    //{'MGM HD'},
    //{'Science HD'},
    //{'NFL Network HD'},
    //{'Destination America HD'},
    //{'NFL RedZone HD'},
    {'iNDemand Movies & Events'},
    {'iNDemand Movies & Events'},
    {'iNDemand Movies & Events'},
    {'iNDemand Movies & Events'},
    {'iNDemand Movies & Events'},
    {'iNDemand Movies & Events'},
    {'iNDemand Movies & Events'},
    //{'Adult Pay-Per-View'},
    {'Hit List'},
    {'Hip Hop and R&B'},
    {'MC University'},
    {'Dance/Electronica'},
    {'Rap'},
    {'Hip-Hop Classics'},
    {'Throwback Jamz'},
    {'R&B Classics'},
    {'R&B Soul'},
    {'Gospel'},
    {'Reggae'},
    {'Classic Rock'},
    {'Retro Rock'},
    {'Rock'},
    {'Metal'},
    {'Alternative'},
    {'Classic Alternative'},
    {'Adult Alternative'},
    {'Soft Rock'},
    {'Pop Hits'},
    {'90s'},
    {'80s'},
    {'70s'},
    {'Solid Gold Oldies'},
    {'Party Favorites'},
    {'Stage & Screen'},
    {'Kidz Only!'},
    {'Toddler Tunes'},
    {'Today�s Country'},
    {'True Country'},
    {'Classic Country'},
    {'Contemporary Christian'},
    {'Sounds of the Seasons'},
    {'Soundscapes'},
    {'Smooth Jazz'},
    {'Jazz'},
    {'Blues'},
    {'Singers & Swing'},
    {'Easy Listening'},
    {'Classical Masterpieces'},
    {'Light Classical'},
    {'Musica Urbana'},
    {'Pop Latino'},
    {'Tropicales'},
    {'Mexicana'},
    {'Romances'},
    {'MetroCast On Demand'}
};

// Icon location
CH2_ABC_WMAR_BALTIMORE_icon		= 1;
CH3_PBS_WETA_DC_icon			= 2;
CH4_NBC_WRC_DC_icon			= 3;
CH5_FOX_WTTG_DC_icon			= 4;
CH6_MY20_WDCA_DC_icon			= 5;
CH7_ABC_WJLA_DC_icon			= 6;
CH8_CW_WDCW_DC_icon			= 7;
CH9_CBS_WUSA_DC_icon			= 8;
CH10_METROCAST_LOCAL_icon		= 9;
CH12_ION_WPXW_DC_icon			= 10;
CH15_QVC_icon				= 11;
CH16_CSPAN_icon				= 12;
CH17_HSN_icon				= 13;
CH18_CSPAN2_icon			= 14;
CH20_EWTN_icon				= 15;
CH21_TBN_icon				= 16;
CH22_PBS_WMPT_ANNAPOLIS_icon		= 17;
CH23_ESPN_icon				= 18;
CH24_ESPN2_icon				= 19;
CH25_COMCAST_SPORTSNET_PLUS_icon	= 20;
CH26_COMCAST_SPORTSNET_icon		= 21;
CH27_SPEED_icon				= 22;
CH28_NBC_SPORTS_NETWORK_icon		= 23;
CH29_MASN_icon			 	= 24;
CH30_MASN2_icon				= 25;
CH32_OUTDOOR_CHANNEL_icon		= 26;
CH34_CNN_icon				= 27;
CH35_HLN_icon				= 28;
CH36_CNBC_icon				= 29;
CH37_THE_WEATHER_CHANNEL_icon		= 30;
CH38_FOX_NEWS_icon			= 31;
CH39_MSNBC_icon				= 32;
CH40_PENTAGON_CHANNEL_icon		= 33;
CH41_USA_icon				= 34;
CH42_ABC_FAMILY_icon			= 35;
CH43_HALLMARK_CHANNEL_icon		= 36;
CH44_HALLMARK_MOVIE_CHANNEL_icon	= 37;
CH45_TBS_icon				= 38;
CH46_TV_LAND_icon			= 39;
CH47_TNT_icon				= 40;
CH48_A_AND_E_icon			= 41;		// A&E
CH49_SYFY_icon				= 42;
CH50_NICKELODEON_icon			= 43;
CH51_CARTOON_NETWORK_icon		= 44;
CH52_DISNEY_CHANNEL_icon		= 45;
CH53_DISCOVERY_CHANNEL_icon		= 46;
CH54_TRAVEL_CHANNEL_icon		= 47;
CH55_ANIMAL_PLANET_icon			= 48;
CH56_NATIONAL_GEOGRAPHIC_icon		= 49;
CH57_HISTORY_icon			= 50;
CH58_TRU_TV_icon			= 51;
CH59_BRAVO_icon				= 52;
CH60_LIFETIME_icon			= 53;
CH61_LMN_icon				= 54;
CH62_DISNEY_JUNIOR_icon			= 55;
CH63_E_icon				= 56;		// E!
CH64_FOOD_NETWORK_icon			= 57;
CH65_HGTV_icon				= 58;
CH66_TLC_icon				= 59;
CH67_AMC_icon				= 60;
CH68_TURNER_CLASSIC_MOVIES_icon		= 61;
CH69_FX_MOVIE_NETWORK_icon		= 62;
CH70_FX_icon				= 63;
CH71_SPIKE_icon				= 64;
CH72_COMEDY_CENTRAL_icon		= 65;
CH73_GAC_icon				= 66;
CH74_OXYGEN_icon			= 67;
CH75_BET_icon				= 68;
CH76_MTV_icon				= 69;
CH77_VH1_icon				= 70;
CH78_CMT_icon				= 71;
CH79_JEWELRY_TV_icon			= 72;
CH95_GOVERNMENT_LOCAL_icon		= 73;
CH96_EDUCATIONAL_LOCAL_icon		= 74;
CH97_ZAP2IT_GUIDE_icon			= 75;
CH98_EDUCATIONAL_CSM_icon		= 76;
CH100_THE_HUB_icon			= 145;
CH101_NICKTOONS_icon			= 146;
CH102_SPROUT_icon			= 147;
CH103_NICK_JR_icon			= 148;
CH104_DISNEY_XD_icon			= 149;
CH105_TEEN_NICK_icon			= 150;
CH106_BOOMERANG_icon			= 151;
CH107_WETA_FAMILY_DC_icon		= 77;
CH108_WETA_UK_DC_icon			= 78;
CH109_TV_ONE_icon			= 152;
CH110_MOVIEPLEX_icon			= 153;
CH111_CHILLER_icon			= 154;
CH114_NAT_GEO_WILD_icon			= 155;
CH115_INVESTIGATIN_DISCOVERY_icon	= 156;
CH116_BBC_AMERICA_icon			= 157;
CH117_BLOOMBERG_icon			= 158;
CH119_BIOGRAPHY_icon			= 159;
CH120_H2_icon				= 160;
CH121_SCIENCE_icon			= 161;
CH122_MILITARY_CHANNEL_icon		= 162;
CH123_NBC_WRC_COZI_TV_DC_icon		= 79;
CH124_WUSA_WEATHER_RADAR_DC_icon	= 80;
CH125_WDCW_ANTENNA_TV_DC_icon		= 81;
CH126_WDCW_THIS_TV_DC_icon		= 82;
CH127_WJLA_LIVE_WELL_NETWORK_DC_icon	= 83;
CH128_WJLA_METV_DC_icon			= 0;
CH130_OWN_icon				= 163;
CH131_DESTINATION_AMERICA_icon		= 164;
CH132_REELZ_CHANNEL_icon		= 165;
CH134_LIFETIME_REAL_WOMEN_icon		= 166;
CH136_STYLE_icon			= 167;
CH140_GSN_icon				= 168;
CH141_HRTV_icon				= 169;
CH142_ESPNU_icon			= 170;
CH143_NFL_NETWORK_icon			= 171;
CH144_MLB_NETWORK_icon			= 172;
CH145_GOLF_CHANNEL_icon			= 173;
CH146_G4_icon				= 174;
CH147_FOX_BUSINESS_NETWORK_icon		= 175;
CH148_FOX_SOCCER_icon			= 176;
CH149_CBS_SPORTS_NETWORK_icon		= 177;
CH151_MTV2_icon				= 178;
CH152_MTV_HITS_icon			= 179;
CH153_VH1_CLASSIC_icon			= 180;
CH154_VH1_SOUL_icon			= 181;
CH155_CMT_PURE_COUNTRY_icon		= 182;
CH156_UP_icon				= 183;
CH158_THE_WORD_NETWORK_icon		= 184;
CH200_DISCOVERY_FIT_AND_HEALTH_icon	= 130;
CH201_DIY_icon				= 131;
CH202_COOKING_CHANNEL_icon		= 132;
CH203_WE_icon				= 133;
CH204_FUSE_icon				= 134;
CH209_NFL_REDZONE_icon			= 135;
CH210_ESPNEWS_icon			= 136;
CH211_ESPN_CLASSIC_icon			= 137;
CH212_YES_NATIONAL_icon			= 138;
CH214_FOX_COLLEGE_SPORTS_ATLANTIC_icon	= 139;
CH215_FOX_COLLEGE_SPORTS_CENTRAL_icon	= 140;
CH216_FOX_COLLEGE_SPORTS_PACIFIC_icon	= 141;
CH217_FUEL_TV_icon			= 142;
CH270_INDEPENDENT_FILM_CHANNEL_icon	= 143;
CH300_HBO_icon				= 197;
CH301_HBO2_icon				= 198;
CH302_HBO_SIGNATURE_icon		= 199;
CH303_HBO_FAMILY_icon			= 200;
CH304_HBO_COMEDY_icon			= 201;
CH305_HBO_ZONE_icon			= 202;
CH325_HBO_HD_icon			= 203;
CH350_CINEMAX_icon			= 192;
CH351_MOREMAX_icon			= 193;
CH352_ACTIONMAX_icon			= 194;
CH353_THRILLERMAX_icon			= 195;
CH375_CINEMAX_HD_icon			= 196;
CH400_SHOWTIME_icon			= 204;
CH401_SHOWTIME2_icon			= 205;
CH402_SHOWTIME_SHOWCASE_icon		= 206;
CH403_SHOWTIME_EXTREME_icon		= 207;
CH404_SHOWTIME_WOMEN_icon		= 208;
CH405_SHOWTIME_FAMILY_ZONE_icon		= 209;
CH406_SHOWTIME_NEXT_icon		= 210;
CH407_THE_MOVIE_CHANNEL_icon		= 211;
CH408_THE_MOVIE_CHANNEL_XTRA_icon	= 212;
CH409_FLIX_icon				= 213;
CH425_SHOWTIME_HD_icon			= 214;
CH450_STARZ_icon			= 215;
CH451_STARZ_EDGE_icon			= 216;
CH452_STARZ_IN_BLACK_icon		= 217;
CH453_STARZ_KIDS_AND_FAMILY_icon	= 218;
CH454_STARZ_CINEMA_icon			= 219;
CH455_STARZ_COMEDY_icon			= 220;
CH456_ENCORE_icon			= 221;
CH457_ENCORE_ACTION_icon		= 222;
CH458_ENCORE_DRAMA_icon			= 223;
CH459_ENCORE_LOVE_icon			= 224;
CH460_ENCORE_SUSPENSE_icon		= 225;
CH461_ENCORE_WESTERNS_icon		= 226;
CH462_ENCORE_FAMILY_icon		= 227;
CH475_STARZ_HD_icon			= 228;
CH702_ABC_WMAR_HD_BALTIMORE_icon	= 84;
CH703_PBS_WETA_HD_DC_icon		= 85;
CH704_NBC_WRC_HD_DC_icon		= 86;
CH705_FOX_WTTG_HD_DC_icon		= 87;
CH706_MY20_WDCA_HD_DC_icon		= 88;
CH707_ABC_WJLA_HD_DC_icon		= 89;
CH709_CBS_WUSA_HD_DC_icon		= 90;
CH715_QVC_HD_icon			= 91;
CH723_ESPN_HD_icon			= 92;
CH724_ESPN2_HD_icon			= 93;
CH725_COMCAST_SPORTSNET_PLUS_HD_icon	= 94;
CH726_COMCAST_SPORTSNET_HD_icon		= 95;
CH727_SPEED_HD_icon			= 96;
CH728_NBC_SPORTS_NETWORK_HD_icon	= 97;
CH729_MASN_HD_icon			= 98;
CH730_GOLF_CHANNEL_HD_icon		= 186;
CH732_OUTDOOR_CHANNEL_HD_icon		= 99;
CH733_MASN_HD_2_icon			= 100;
CH734_CNN_HD_icon			= 101;
CH737_THE_WEATHER_CHANNEL_HD_icon	= 102;
CH738_FOX_NEWS_HD_icon			= 103;
CH741_UNIVERSAL_HD_icon			= 189;
CH742_ABC_FAMILY_HD_icon		= 104;
CH745_TBS_HD_icon			= 105;
CH747_TNT_HD_icon			= 106;
CH748_A_AND_E_HD_icon			= 107;		// A&E
CH749_SYFY_HD_icon			= 108;
CH752_DISNEY_CHANNEL_HD_icon		= 109;
CH753_DISCOVERY_CHANNEL_HD_icon		= 110;
CH755_ANIMAL_PLANET_HD_icon		= 111;
CH756_NATIONAL_GEOGRAPHIC_HD_icon	= 112;
CH757_HISTORY_HD_icon			= 113;
CH759_BRAVO_HD_icon			= 114;
CH760_LIFETIME_HD_icon			= 115;
CH761_LMN_HD_icon			= 116;
CH763_E_HD_icon				= 117;		// E!
CH764_FOOD_NETWORK_HD_icon		= 118;
CH765_HGTV_HD_icon			= 119;
CH766_TLC_HD_icon			= 120;
CH767_AMC_HD_icon			= 121;
CH770_FX_HD_icon			= 122;
CH774_OXYGEN_HD_icon			= 123;
CH780_VELOCITY_HD_icon			= 124;
CH781_PALLADIA_HD_icon			= 190;
CH782_USA_HD_icon			= 125;
CH783_MGM_HD_icon			= 191;
CH784_SCIENCE_HD_icon			= 187;
CH785_NFL_NETWORK_HD_icon		= 185;
CH786_DESINATION_AMERICA_HD_icon	= 188;
CH787_NFL_REDZONE_HD_icon		= 144;
CH800_INDEMAND_MOVIES_AND_EVENTS_1_icon	= 127;
CH801_INDEMAND_MOVIES_AND_EVENTS_2_icon	= 127;
CH802_INDEMAND_MOVIES_AND_EVENTS_3_icon	= 127;
CH803_INDEMAND_MOVIES_AND_EVENTS_4_icon	= 127;
CH804_INDEMAND_MOVIES_AND_EVENTS_5_icon	= 127;
CH805_INDEMAND_MOVIES_AND_EVENTS_6_icon	= 127;
CH806_INDEMAND_MOVIES_AND_EVENTS_7_icon	= 127;
CH899_ADULT_PAY_PER_VIEW_icon		= 128;
CH903_MUSIC_HIT_LIST_icon		= 126;
CH904_MUSIC_HIP_HOP_AND_R_AND_B_icon	= 126;
CH905_MUSIC_MC_UNIVERSITY_icon		= 126;
CH906_MUSIC_DANCE_ELECTRONICA_icon	= 126;
CH907_MUSIC_RAP_icon			= 126;
CH908_MUSIC_HIPHOP_CLASSICS_icon	= 126;
CH909_MUSIC_THROWBACK_JAMZ_icon		= 126;
CH910_MUSIC_R_AND_B_CLASSICS_icon	= 126;
CH911_MUSIC_R_AND_B_SOUL_icon		= 126;
CH912_MUSIC_GOSPEL_icon			= 126;
CH913_MUSIC_REGGE_icon			= 126;
CH914_MUSIC_CLASSIC_ROCK_icon		= 126;
CH915_MUSIC_RETRO_ROCK_icon		= 126;
CH916_MUSIC_ROCK_icon			= 126;
CH917_MUSIC_METAL_icon			= 126;
CH918_MUSIC_ALTERNATIVE_icon		= 126;
CH919_MUSIC_CLASSIC_ALTERNATIVE_icon	= 126;
CH920_MUSIC_ADULT_ALTERNATIVE_icon	= 126;
CH921_MUSIC_SOFT_ROCK_icon		= 126;
CH922_MUSIC_POP_HITS_icon		= 126;
CH923_MUSIC_90S_icon			= 126;
CH924_MUSIC_80S_icon			= 126;
CH925_MUSIC_70S_icon			= 126;
CH926_MUSIC_SOLID_GOLD_OLDIES_icon	= 126;
CH927_MUSIC_PARTY_FAVORITES_icon	= 126;
CH928_MUSIC_STAGE_AND_SCREEN_icon	= 126;
CH929_MUSIC_KIDZ_ONLY_icon		= 126;
CH930_MUSIC_TODDLER_TUNES_icon		= 126;
CH931_MUSIC_TODAYS_COUNTRY_icon		= 126;
CH932_MUSIC_TRUE_COUNTRY_icon		= 126;
CH933_MUSIC_CLASSIC_COUNTRY_icon	= 126;
CH934_MUSIC_CONTEMPORARY_CHRISTIAN_icon	= 126;
CH935_MUSIC_SOUNDS_OF_THE_SEASON_icon	= 126;
CH936_MUSIC_SOUNDSCAPE_icon		= 126;
CH937_MUSIC_SMOOTH_JAZZ_icon		= 126;
CH938_MUSIC_JAZZ_icon			= 126;
CH939_MUSIC_BLUES_icon			= 126;
CH940_MUSIC_SINGERS_AND_SWING_icon	= 126;
CH941_MUSIC_EASY_LISTENING_icon		= 126;
CH942_MUSIC_CLASSICAL_MASTERPIECES_icon	= 126;
CH943_MUSIC_LIGHT_CLASSICAL_icon	= 126;
CH944_MUSIC_MUSICA_URBANA_icon		= 126;
CH945_MUSIC_POP_LATINO_icon		= 126;
CH946_MUSIC_TROPICALES_icon		= 126;
CH947_MUSIC_MEXICANA_icon		= 126;
CH948_MUSIC_ROMANCES_icon		= 126;
CH999_METROCAST_ON_DEMAND_icon		= 129;

volatile integer nCableBoxTVFavIcons[] = {
    CH2_ABC_WMAR_BALTIMORE_icon,
    CH3_PBS_WETA_DC_icon,
    CH4_NBC_WRC_DC_icon,
    CH5_FOX_WTTG_DC_icon,
    CH6_MY20_WDCA_DC_icon,
    CH7_ABC_WJLA_DC_icon,
    CH8_CW_WDCW_DC_icon,
    CH9_CBS_WUSA_DC_icon,
    CH10_METROCAST_LOCAL_icon,
    CH12_ION_WPXW_DC_icon,
    CH15_QVC_icon,
    CH16_CSPAN_icon,
    CH17_HSN_icon,
    CH18_CSPAN2_icon,
    CH20_EWTN_icon,
    CH21_TBN_icon,
    CH22_PBS_WMPT_ANNAPOLIS_icon,
    CH23_ESPN_icon,
    CH24_ESPN2_icon,
    CH25_COMCAST_SPORTSNET_PLUS_icon,
    CH26_COMCAST_SPORTSNET_icon,
    CH27_SPEED_icon,
    CH28_NBC_SPORTS_NETWORK_icon,
    CH29_MASN_icon,
    CH30_MASN2_icon,
    CH32_OUTDOOR_CHANNEL_icon,
    CH34_CNN_icon,
    CH35_HLN_icon,
    CH36_CNBC_icon,
    CH37_THE_WEATHER_CHANNEL_icon,
    CH38_FOX_NEWS_icon,
    CH39_MSNBC_icon,
    CH40_PENTAGON_CHANNEL_icon,
    CH41_USA_icon,
    CH42_ABC_FAMILY_icon,
    CH43_HALLMARK_CHANNEL_icon,
    CH44_HALLMARK_MOVIE_CHANNEL_icon,
    CH45_TBS_icon,
    CH46_TV_LAND_icon,
    CH47_TNT_icon,
    CH48_A_AND_E_icon,
    CH49_SYFY_icon,
    CH50_NICKELODEON_icon,
    CH51_CARTOON_NETWORK_icon,
    CH52_DISNEY_CHANNEL_icon,
    CH53_DISCOVERY_CHANNEL_icon,
    CH54_TRAVEL_CHANNEL_icon,
    CH55_ANIMAL_PLANET_icon,
    CH56_NATIONAL_GEOGRAPHIC_icon,
    CH57_HISTORY_icon,
    CH58_TRU_TV_icon,
    CH59_BRAVO_icon,
    CH60_LIFETIME_icon,
    CH61_LMN_icon,
    CH62_DISNEY_JUNIOR_icon,
    CH63_E_icon,
    CH64_FOOD_NETWORK_icon,
    CH65_HGTV_icon,
    CH66_TLC_icon,
    CH67_AMC_icon,
    CH68_TURNER_CLASSIC_MOVIES_icon,
    CH69_FX_MOVIE_NETWORK_icon,
    CH70_FX_icon,
    CH71_SPIKE_icon,
    CH72_COMEDY_CENTRAL_icon,
    CH73_GAC_icon,
    CH74_OXYGEN_icon,
    CH75_BET_icon,
    CH76_MTV_icon,
    CH77_VH1_icon,
    CH78_CMT_icon,
    CH79_JEWELRY_TV_icon,
    CH95_GOVERNMENT_LOCAL_icon,
    CH96_EDUCATIONAL_LOCAL_icon,
    CH97_ZAP2IT_GUIDE_icon,
    CH98_EDUCATIONAL_CSM_icon,
    CH100_THE_HUB_icon,
    CH101_NICKTOONS_icon,
    CH102_SPROUT_icon,
    CH103_NICK_JR_icon,
    CH104_DISNEY_XD_icon,
    CH105_TEEN_NICK_icon,
    CH106_BOOMERANG_icon,
    CH107_WETA_FAMILY_DC_icon,
    CH108_WETA_UK_DC_icon,
    CH109_TV_ONE_icon,
    CH110_MOVIEPLEX_icon,
    CH111_CHILLER_icon,
    CH114_NAT_GEO_WILD_icon,
    CH115_INVESTIGATIN_DISCOVERY_icon,
    CH116_BBC_AMERICA_icon,
    CH117_BLOOMBERG_icon,
    CH119_BIOGRAPHY_icon,
    CH120_H2_icon,
    CH121_SCIENCE_icon,
    CH122_MILITARY_CHANNEL_icon,
    CH123_NBC_WRC_COZI_TV_DC_icon,
    CH124_WUSA_WEATHER_RADAR_DC_icon,
    CH125_WDCW_ANTENNA_TV_DC_icon,
    CH126_WDCW_THIS_TV_DC_icon,
    CH127_WJLA_LIVE_WELL_NETWORK_DC_icon,
    CH128_WJLA_METV_DC_icon,
    CH130_OWN_icon,
    CH131_DESTINATION_AMERICA_icon,
    CH132_REELZ_CHANNEL_icon,
    CH134_LIFETIME_REAL_WOMEN_icon,
    CH136_STYLE_icon,
    CH140_GSN_icon,
    CH141_HRTV_icon,
    CH142_ESPNU_icon,
    CH143_NFL_NETWORK_icon,
    CH144_MLB_NETWORK_icon,
    CH145_GOLF_CHANNEL_icon,
    CH146_G4_icon,
    CH147_FOX_BUSINESS_NETWORK_icon,
    CH148_FOX_SOCCER_icon,
    CH149_CBS_SPORTS_NETWORK_icon,
    CH151_MTV2_icon,
    CH152_MTV_HITS_icon,
    CH153_VH1_CLASSIC_icon,
    CH154_VH1_SOUL_icon,
    CH155_CMT_PURE_COUNTRY_icon,
    CH156_UP_icon,
    CH158_THE_WORD_NETWORK_icon,
    CH200_DISCOVERY_FIT_AND_HEALTH_icon,
    CH201_DIY_icon,
    CH202_COOKING_CHANNEL_icon,
    CH203_WE_icon,
    CH204_FUSE_icon,
    CH209_NFL_REDZONE_icon,
    CH210_ESPNEWS_icon,
    CH211_ESPN_CLASSIC_icon,
    CH212_YES_NATIONAL_icon,
    CH214_FOX_COLLEGE_SPORTS_ATLANTIC_icon,
    CH215_FOX_COLLEGE_SPORTS_CENTRAL_icon,
    CH216_FOX_COLLEGE_SPORTS_PACIFIC_icon,
    CH217_FUEL_TV_icon,
    CH270_INDEPENDENT_FILM_CHANNEL_icon,
    CH300_HBO_icon,
    CH301_HBO2_icon,
    CH302_HBO_SIGNATURE_icon,
    CH303_HBO_FAMILY_icon,
    CH304_HBO_COMEDY_icon,
    CH305_HBO_ZONE_icon,
    CH325_HBO_HD_icon,
    CH350_CINEMAX_icon,
    CH351_MOREMAX_icon,
    CH352_ACTIONMAX_icon,
    CH353_THRILLERMAX_icon,
    CH375_CINEMAX_HD_icon,
    CH400_SHOWTIME_icon,
    CH401_SHOWTIME2_icon,
    CH402_SHOWTIME_SHOWCASE_icon,
    CH403_SHOWTIME_EXTREME_icon,
    CH404_SHOWTIME_WOMEN_icon,
    CH405_SHOWTIME_FAMILY_ZONE_icon,
    CH406_SHOWTIME_NEXT_icon,
    CH407_THE_MOVIE_CHANNEL_icon,
    CH408_THE_MOVIE_CHANNEL_XTRA_icon,
    CH409_FLIX_icon,
    CH425_SHOWTIME_HD_icon,
    CH450_STARZ_icon,
    CH451_STARZ_EDGE_icon,
    CH452_STARZ_IN_BLACK_icon,
    CH453_STARZ_KIDS_AND_FAMILY_icon,
    CH454_STARZ_CINEMA_icon,
    CH455_STARZ_COMEDY_icon,
    CH456_ENCORE_icon,
    CH457_ENCORE_ACTION_icon,
    CH458_ENCORE_DRAMA_icon,
    CH459_ENCORE_LOVE_icon,
    CH460_ENCORE_SUSPENSE_icon,
    CH461_ENCORE_WESTERNS_icon,
    CH462_ENCORE_FAMILY_icon,
    CH475_STARZ_HD_icon,
    CH702_ABC_WMAR_HD_BALTIMORE_icon,
    CH703_PBS_WETA_HD_DC_icon,
    CH704_NBC_WRC_HD_DC_icon,
    CH705_FOX_WTTG_HD_DC_icon,
    CH706_MY20_WDCA_HD_DC_icon,
    CH707_ABC_WJLA_HD_DC_icon,
    CH709_CBS_WUSA_HD_DC_icon,
    CH715_QVC_HD_icon,
    CH723_ESPN_HD_icon,
    CH724_ESPN2_HD_icon,
    CH725_COMCAST_SPORTSNET_PLUS_HD_icon,
    CH726_COMCAST_SPORTSNET_HD_icon,
    CH727_SPEED_HD_icon,
    CH728_NBC_SPORTS_NETWORK_HD_icon,
    CH729_MASN_HD_icon,
    CH730_GOLF_CHANNEL_HD_icon,
    CH732_OUTDOOR_CHANNEL_HD_icon,
    CH733_MASN_HD_2_icon,
    CH734_CNN_HD_icon,
    CH737_THE_WEATHER_CHANNEL_HD_icon,
    CH738_FOX_NEWS_HD_icon,
    CH741_UNIVERSAL_HD_icon,
    CH742_ABC_FAMILY_HD_icon,
    CH745_TBS_HD_icon,
    CH747_TNT_HD_icon,
    CH748_A_AND_E_HD_icon,
    CH749_SYFY_HD_icon,
    CH752_DISNEY_CHANNEL_HD_icon,
    CH753_DISCOVERY_CHANNEL_HD_icon,
    CH755_ANIMAL_PLANET_HD_icon,
    CH756_NATIONAL_GEOGRAPHIC_HD_icon,
    CH757_HISTORY_HD_icon,
    CH759_BRAVO_HD_icon,
    CH760_LIFETIME_HD_icon,
    CH761_LMN_HD_icon,
    CH763_E_HD_icon,
    CH764_FOOD_NETWORK_HD_icon,
    CH765_HGTV_HD_icon,
    CH766_TLC_HD_icon,
    CH767_AMC_HD_icon,
    CH770_FX_HD_icon,
    CH774_OXYGEN_HD_icon,
    CH780_VELOCITY_HD_icon,
    CH781_PALLADIA_HD_icon,
    CH782_USA_HD_icon,
    CH783_MGM_HD_icon,
    CH784_SCIENCE_HD_icon,
    CH785_NFL_NETWORK_HD_icon,
    CH786_DESINATION_AMERICA_HD_icon,
    CH787_NFL_REDZONE_HD_icon,
    CH800_INDEMAND_MOVIES_AND_EVENTS_1_icon,
    CH801_INDEMAND_MOVIES_AND_EVENTS_2_icon,
    CH802_INDEMAND_MOVIES_AND_EVENTS_3_icon,
    CH803_INDEMAND_MOVIES_AND_EVENTS_4_icon,
    CH804_INDEMAND_MOVIES_AND_EVENTS_5_icon,
    CH805_INDEMAND_MOVIES_AND_EVENTS_6_icon,
    CH806_INDEMAND_MOVIES_AND_EVENTS_7_icon,
    CH899_ADULT_PAY_PER_VIEW_icon,
    CH903_MUSIC_HIT_LIST_icon,
    CH904_MUSIC_HIP_HOP_AND_R_AND_B_icon,
    CH905_MUSIC_MC_UNIVERSITY_icon,
    CH906_MUSIC_DANCE_ELECTRONICA_icon,
    CH907_MUSIC_RAP_icon,
    CH908_MUSIC_HIPHOP_CLASSICS_icon,
    CH909_MUSIC_THROWBACK_JAMZ_icon,
    CH910_MUSIC_R_AND_B_CLASSICS_icon,
    CH911_MUSIC_R_AND_B_SOUL_icon,
    CH912_MUSIC_GOSPEL_icon,
    CH913_MUSIC_REGGE_icon,
    CH914_MUSIC_CLASSIC_ROCK_icon,
    CH915_MUSIC_RETRO_ROCK_icon,
    CH916_MUSIC_ROCK_icon,
    CH917_MUSIC_METAL_icon,
    CH918_MUSIC_ALTERNATIVE_icon,
    CH919_MUSIC_CLASSIC_ALTERNATIVE_icon,
    CH920_MUSIC_ADULT_ALTERNATIVE_icon,
    CH921_MUSIC_SOFT_ROCK_icon,
    CH922_MUSIC_POP_HITS_icon,
    CH923_MUSIC_90S_icon,
    CH924_MUSIC_80S_icon,
    CH925_MUSIC_70S_icon,
    CH926_MUSIC_SOLID_GOLD_OLDIES_icon,
    CH927_MUSIC_PARTY_FAVORITES_icon,
    CH928_MUSIC_STAGE_AND_SCREEN_icon,
    CH929_MUSIC_KIDZ_ONLY_icon,
    CH930_MUSIC_TODDLER_TUNES_icon,
    CH931_MUSIC_TODAYS_COUNTRY_icon,
    CH932_MUSIC_TRUE_COUNTRY_icon,
    CH933_MUSIC_CLASSIC_COUNTRY_icon,
    CH934_MUSIC_CONTEMPORARY_CHRISTIAN_icon,
    CH935_MUSIC_SOUNDS_OF_THE_SEASON_icon,
    CH936_MUSIC_SOUNDSCAPE_icon,
    CH937_MUSIC_SMOOTH_JAZZ_icon,
    CH938_MUSIC_JAZZ_icon,
    CH939_MUSIC_BLUES_icon,
    CH940_MUSIC_SINGERS_AND_SWING_icon,
    CH941_MUSIC_EASY_LISTENING_icon,
    CH942_MUSIC_CLASSICAL_MASTERPIECES_icon,
    CH943_MUSIC_LIGHT_CLASSICAL_icon,
    CH944_MUSIC_MUSICA_URBANA_icon,
    CH945_MUSIC_POP_LATINO_icon,
    CH946_MUSIC_TROPICALES_icon,
    CH947_MUSIC_MEXICANA_icon,
    CH948_MUSIC_ROMANCES_icon,
    CH999_METROCAST_ON_DEMAND_icon
}

// celia stuff
MASSAGE_TYPE_SWEDISH = 1;
MASSAGE_TYPE_DEEP_TISSUE = 2;
MASSAGE_TYPE_PREGNACY = 3;
MASSAGE_TYPE_HOT_STONE = 4;

MASSAGE_TIMELINE = 1;
MASSAGE_LENGTH_30_MINUTES = 1;
MASSAGE_LENGTH_60_MINUTES = 2;
MASSAGE_LENGTH_90_MINUTES = 3;

MASSAGE_SESSION_NOT_ACTIVE = 0;
MASSAGE_SESSION_ACTIVE = 1;

MASSAGE_TIMER = 10;

// nCeliaBtn's
MENU_NEW_SESSION_BTN = 1;
MENU_CHECKOUT_BTN = 2;
MENU_SCHEDULE_BTN = 3;
MENU_NOTES_BTN = 4;
MENU_MUSIC_BTN = 5;

NEW_SESSION_NEW_CLIENT_BTN = 6;
NEW_SESSION_EXISTING_CLIENT_BTN = 7;

NEW_CLIENT_FIRST_NAME_BTN = 8;
NEW_CLIENT_LAST_NAME_BTN = 9;

MASSAGE_TYPE_SWEDISH_BTN = 10;
MASSAGE_TYPE_DEEP_TISSUE_BTN = 11;
MASSAGE_TYPE_PREGNACY_BTN = 12;
MASSAGE_TYPE_HOT_STONE_BTN = 13;

MASSAGE_LENGTH_30_MINUTES_BTN = 14;
MASSAGE_LENGTH_60_MINUTES_BTN = 15;
MASSAGE_LENGTH_90_MINUTES_BTN = 16;

MASSAGE_ACTIVE_START_BTN = 17;

volatile integer nCeliaBtns[] = {
    MENU_NEW_SESSION_BTN,
    MENU_CHECKOUT_BTN,
    MENU_SCHEDULE_BTN,
    MENU_NOTES_BTN,
    MENU_MUSIC_BTN,
    NEW_SESSION_NEW_CLIENT_BTN,
    NEW_SESSION_EXISTING_CLIENT_BTN,
    NEW_CLIENT_FIRST_NAME_BTN,
    NEW_CLIENT_LAST_NAME_BTN,
    MASSAGE_TYPE_SWEDISH_BTN,
    MASSAGE_TYPE_DEEP_TISSUE_BTN,
    MASSAGE_TYPE_PREGNACY_BTN,
    MASSAGE_TYPE_HOT_STONE_BTN,
    MASSAGE_LENGTH_30_MINUTES_BTN,
    MASSAGE_LENGTH_60_MINUTES_BTN,
    MASSAGE_LENGTH_90_MINUTES_BTN,
    MASSAGE_ACTIVE_START_BTN
}

(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE

// TP
struct _Touchpanel {
    INTEGER nZoneSelected
}

// Blu-ray/DVD
struct _Disc_Info {
    INTEGER number
    CHAR duration[11]
    LONG numofTitles
    LONG numofTracks
    CHAR discType[12]
    CHAR id
}

struct _Title_Info {
    INTEGER number
    CHAR duration[11]
    LONG numofTracks
    INTEGER discNumber
}

struct _Track_Info {
    INTEGER number
    CHAR duraction[11]
    INTEGER discNumber
}

struct _Bluray_DVD {
    INTEGER nOnline
    _Disc_Info DiscInfo
    _Title_Info TitleInfo
    _Track_Info TrackInfo
}

// TV
struct _CableBox {
    INTEGER nCurrentChannel
    INTEGER nPresets[20]
    INTEGER nPresetBeingEdited
    CHAR cPresetTemp[1][3]		// temporarily holds the new preset channel
};

// Celias stuff
struct _Client {
    CHAR cFirstName[20]
    CHAR cLastName[20]
    CHAR cDOB[9]
    CHAR cAddress[40]
    CHAR cPhone[13]
    CHAR cPMH[200]		// past medical history
};

struct _Time {
    INTEGER nHours
    INTEGER nMinutes
    INTEGER nSeconds
}

struct _Appointment {
    _Client sClient
    _Time sRemaingingTime
    CHAR cDate[9]
    CHAR cTime[8]
    INTEGER nMassageType
    INTEGER nMassageLength
    CHAR cSessionNotes[200]
    INTEGER nSessionActive;
};



(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE

// TP
volatile _Touchpanel sTouchpanel[1];

// Cable box
persistent _CableBox sCableBox;

// Sonos
volatile integer sonos_start_port = 180;

// Apple TV
volatile char nAppleTV_IP[] = '192.168.1.149'; //'apple-tv.local';
volatile char nAppleTV_Port[] = '80';
volatile integer nAppleTV_Protocol = IP_TCP;

// Blu-ray/DVD
volatile char nBluray_IP[] = '192.168.1.140';
volatile char nBluray_Port[] = '8102';
volatile integer nBluray_Protocol = IP_TCP;
volatile _Bluray_DVD uBluray_DVD

// celia stuff
volatile _Appointment sAppointment;	
volatile _Time sStartTime;
volatile _Time sEndTime;

LONG TimeArray_1_Second[1] = 1000;

LONG TimeArray_30_Minutes[1] = 1800000;
LONG TimeArray_60_Minutes[1] = 3600000;
LONG TimeArray_90_Minutes[1] = 5400000;

integer editingFirstname = 0;
integer editingLastname = 0;


(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING


(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE


(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)

DEFINE_CALL 'Room off'(nRoom) {
    
}

DEFINE_FUNCTION readStuffFromFile(CHAR cFileName[]){
    STACK_VAR SLONG slFileHandle     // stores the tag that represents the file (or and error code)
    LOCAL_VAR SLONG slResult         // stores the number of bytes read (or an error code)
    STACK_VAR CHAR  oneline[2000]    // a buffer for reading one line.  Must be as big or bigger than the biggest line
    STACK_VAR INTEGER INC

    slFileHandle = FILE_OPEN(cFileName,FILE_READ_ONLY) // OPEN FILE FROM THE BEGINNING

    IF(slFileHandle>0){               // A POSITIVE NUMBER IS RETURNED IF SUCCESSFUL
	slResult = 1               // seed with a good number so the loop runs at least once
	
	WHILE(slResult>0){
            slResult = FILE_READ_LINE(slFileHandle,oneline,MAX_LENGTH_STRING(oneline)) // grab one line from the file
            parseLineFromFile(oneline)
	}
	FILE_CLOSE(slFileHandle)   // CLOSE THE LOG FILE
    }           
    ELSE{
	SEND_STRING 0,"'FILE OPEN ERROR:',ITOA(slFileHandle)"  // IF THE LOG FILE COULD NOT BE CREATED
    }
}

DEFINE_FUNCTION parseLineFromFile(CHAR aLine[]){
      /// normal string parsing here...
}

DEFINE_FUNCTION appendToFile (CHAR cFileName[],CHAR cLogString[]){

   STACK_VAR SLONG slFileHandle     // stores the tag that represents the file (or and error code)
   LOCAL_VAR SLONG slResult         // stores the number of bytes written (or an error code)
   slFileHandle = FILE_OPEN(cFileName,FILE_RW_APPEND) // OPEN OLD FILE (OR CREATE NEW ONE)    

    IF(slFileHandle>0){               // A POSITIVE NUMBER IS RETURNED IF SUCCESSFUL
	slResult = FILE_WRITE_LINE(slFileHandle,cLogString,LENGTH_STRING(cLogString)) // WRITE THE NEW INFO
	FILE_CLOSE(slFileHandle)   // CLOSE THE LOG FILE
    }           

    ELSE{
	SEND_STRING 0,"'FILE OPEN ERROR:',ITOA(slFileHandle)" // IF THE LOG FILE COULD NOT BE CREATED
    }
}

DEFINE_FUNCTION getClientInfo(){
    
}


(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START

// temporary setting until the floor layout is in the TP
#WARN 'Remove this next line, once the TP is updated with zones'
sTouchpanel[1].nZoneSelected = LIVING_ROOM;

// celia stuff
TIMELINE_CREATE(MASSAGE_TIMELINE,TimeArray_1_Second,1,TIMELINE_RELATIVE,TIMELINE_REPEAT);

// Lighting
//DEFINE_MODULE 'LutronHomeWorksP5_dr1_0_117' modLights(vdvLights, dvLights);

// Bluray/DVD
DEFINE_MODULE 'Pioneer_BDP23FD_Comm_dr1_0_0' modBluray(vdvBluray,dvBluray);
//DEFINE_MODULE 'Pioneer_BDP-23FD_Comm' modBluray(vdvBluray, dvBluray, nBluray_IP, nBluray_Port, nBluray_Protocol);

// TV's
//DEFINE_MODULE '<module name>' modTV1(<parameter list>);

// Keypad
//DEFINE_MODULE 'VirtualKeypad_dr1_0_0' modKeypad(vdvVKeypad, dvVKeypad);

// Weather
//DEFINE_MODULE 'Weather' modWeather(vdvWeather,dvWeather);

// apple tv
DEFINE_MODULE 'AppleTv_Firecore' modATV(vdvAppleTV, dvAppleTV, nAppleTV_IP, nAppleTV_Port, nAppleTV_Protocol);

// Sonos
DEFINE_MODULE 'Sonos_0_0_3' modSonos(vdvSonos, sonos_start_port)

(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT
data_event[dvTP_TouchPanels] {
    online: {
	stack_var integer nTP;
	nTP = get_last(dvTP_TouchPanels);
	
	// 
	send_command dvTP_TouchPanels[nTP], 'RXON';
	
	// send zone name
	SEND_COMMAND dvTP_TouchPanels[nTP],"'^TXT-',itoa(ZONE_NAME),',0,',cZoneNames[sTouchpanel[nTP].nZoneSelected]";
	
	switch(dvTP_TouchPanels[nTP]) {
	    case dvTP1_TP_iPad: {
		//send_level dvTP1_Receiver1,VOLUME_LEVEL_FAMILY_ROOM,sReceivers[1].nVolume;
	    }
	}
    }
    string: {
	stack_var integer nTP;
	nTP = get_last(dvTP_TouchPanels);
	
	switch(dvTP_TouchPanels[nTP]) {
	    case dvTP1_TP_iPad: {
		if(editingFirstname){
		    sAppointment.sClient.cFirstName = data.text;
		    editingFirstname = 0;
		    SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(NEW_CLIENT_FIRST_NAME_BTN),',0,',sAppointment.sClient.cFirstName";
		}
		if(editingLastname){
		    sAppointment.sClient.cLastName = data.text;
		    editingLastname = 0;
		    SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(NEW_CLIENT_LAST_NAME_BTN),',0,',sAppointment.sClient.cLastName";
		}
		if((sAppointment.sClient.cFirstName != 0) && (sAppointment.sClient.cLastName != 0)){
		    // hide all popups
		    send_command dvTP1_TP_iPad, "'@PPX'";
		    
		    // show "New Sessions - Massage Type"
		    send_command dvTP1_TP_iPad, "'@PPN-New Session - Massage Type'";
		}
	    }
	}
    }
}

button_event[dvTP1_TP_Zones,nZone] {
    push: {
	stack_var integer nBtn;
	stack_var integer nTP;
	
	nBtn = get_last(nZone);
	//nTP = get_last(dvTP1_TP_Zones);
	nTP = 1;
	
	sTouchpanel[nTP].nZoneSelected = nBtn;
    }
}

button_event[dvTP1_TP_iPad,nShutdown] {
    push: {
	stack_var integer nBtn;
	nBtn = get_last(nShutdown);
	
	switch(nShutdown[nBtn]) {
	    case LIGHTS_OFF:
	    case MUSIC_OFF:
	    case TV_OFF:
	    case ROOM_OFF: {
		CALL 'Room off'(1);
	    }
	}
    }
}

button_event[dvTP1_TP_iPad,nSwipeActions] {
    push: {
	stack_var integer nButton;
	nButton = get_last(nSwipeActions);
	
	switch(nSwipeActions[nButton]) {
	    case SWIPE_SHAKE:
	    case SWIPE_UP: {
		send_command dvTP1_TP_iPad, "'@PPX'";
	    }
	}
    }
}

button_event[dvTP1_TP_iPad,nMenuBarSelection] {
    push: {
	stack_var integer nButton;
	stack_var integer nTP;
	
	nButton = get_last(nMenuBarSelection);
	//nTP = get_last(dvTP1);
	nTP = 1;
	
	// bring subpage forward
	//send_command dvTP1_TP_iPad, "'^SSH-2000,',cTPSubpageNames[nMenuBarSelection[nButton]],''";
	
	/*
	switch(nMenuBarSelection[nButton]) {
	    case SOURCE_WEATHER: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]'";
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]Weather'";
	    }
	    case SOURCE_TRAFFIC_CAMS: {}
	    case SOURCE_NEWS: { }
	    case CONTROLS_LIGHTS: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]'";
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]Lights'";
	    }
	    case CONTROLS_SECURITY: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]'";
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]Security'";
	    }
	    case CONTROLS_HVAC: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]'";
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]Temperature'";
	    }
	    case MAINTANENCE: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]'";
		send_command dvTP1_TP_iPad, "'@PPN-[paneLeft]Maintanence'";
	    }
	}*/
    }
}

button_event[dvTP1_TP_iPad,nMenuBarInputSelection] {
    push: {
	stack_var integer nButton;
	stack_var integer nTP;
	
	nButton = get_last(nMenuBarInputSelection);
	//nTP = get_last(dvTP1);
	nTP = 1;
	
	// bring subpage forward
	//send_command dvTP1_TP_iPad, "'^SSH-2000,Input Controls'";
	//send_command dvTP1_TP_iPad, "'^SSH-3000,',cTPSubpageNames[nMenuBarInputSelection[nButton]],''";
	
	// center subpage (input) icon
	send_command dvTP1_TP_iPad, "'^SSH-1000,',cTPInputSubpageNames[nMenuBarInputSelection[nButton]],''";
	
	switch(nMenuBarInputSelection[nButton]) {
	    case SOURCE_VIDEO: 
	    case SOURCE_CABLE_TV: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneRight]TV'";
	    }
	    case SOURCE_DVR: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneRight][Theater]Cable DVR Global'";
	    }
	    case SOURCE_BLURAY: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneRight]Bluray'";
	    }
	    case SOURCE_APPLETV: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneRight]Apple TV'";
	    }
	    case SOURCE_AUX: {
		send_command dvTP1_TP_iPad, "'@PPN-'";
	    }
	    case SOURCE_INTERCOM: {
		send_command dvTP1_TP_iPad, "'@PPN-[paneRight][Home]Intercom'";
	    }
	    case SOURCE_MUSIC: {
		send_command dvTP1_TP_iPad, "'@PPN-'";
	    }
	    case SOURCE_RADIO: {
		send_command dvTP1_TP_iPad, "'@PPN-'";
	    }
	    case SOURCE_INTERNET_RADIO: {
		send_command dvTP1_TP_iPad, "'@PPN-'";
	    }
	    case SOURCE_AIRPLAY: {
		send_command dvTP1_TP_iPad, "'@PPN-'";
	    }
	}
    }
}

/*
BUTTON_EVENT[dvTP_Receiever1,nVolumeBtns] {
    push: {
	stack_var integer nButton;
	stack_var integer nTP;
	
	nButton = get_last(nVolumeBtns);
	//nTP = get_last(..);
	nTP = 1;
	
	switch(nVolumeBtns[nButton]) {
	    case _VOL_UP: {
		if(sTouchpanel[nTP].nZoneSelected == LIVING_ROOM)
		    TO[vdvReceivers[1],_VOL_UP];
		else if(sTouchpanel[nTP].nZoneSelected == GAME_ROOM)
		    TO[vdvReceivers[2],_VOL_UP];
	    }
	    case _VOL_DW: {
		if(sTouchpanel[nTP].nZoneSelected == LIVING_ROOM)
		    TO[vdvReceivers[1],_VOL_DW];
		else if(sTouchpanel[nTP].nZoneSelected == GAME_ROOM)
		    TO[vdvReceivers[2],_VOL_DW];
	    }
	    case _TOGGLE_MUTE: {
		if(sTouchpanel[nTP].nZoneSelected == LIVING_ROOM)
		    pulse[vdvReceivers[1],_TOGGLE_MUTE];
		else if(sTouchpanel[nTP].nZoneSelected == GAME_ROOM)
		    pulse[vdvReceivers[2],_TOGGLE_MUTE];
	    }
	}
    }
}
*/

DATA_EVENT[vdvBluray] {
    ONLINE: {
	send_string 0, "'Blu-ray Player is Online'";
	uBluray_DVD.nOnline = true;
    }
    OFFLINE: {
	send_string 0, "'Blu-ray Player is Offline'";
	uBluray_DVD.nOnline = false;
    }
    ONERROR: {
	uBluray_DVD.nOnline = false;
    }
    STRING: {
	send_string 0, "'from bluray: ', data.text";
    }
    COMMAND: {
	send_string 0, "'from bluray: ', data.text";
	SELECT {
	    // DISCINFO-1,--:--:--.--,-2147483648,-2147483648,AUDIO_VIDEO,,
	    ACTIVE (FIND_STRING(DATA.TEXT,'DISCINFO-',1)): {
		REMOVE_STRING(DATA.TEXT,'DISCINFO-',1)
		
		// 
		uBluray_DVD.DiscInfo.number = ATOI(LEFT_STRING(DATA.TEXT,1));
		REMOVE_STRING(DATA.TEXT,',',1);
		
		uBluray_DVD.DiscInfo.duration = MID_STRING(DATA.TEXT, 2, 11);
		
		uBluray_DVD.DiscInfo.numofTitles = ATOI(MID_STRING(DATA.TEXT, 2, 11));
		//uBluray_DVD.DiscInfo.numofTracks = 
		//uBluray_DVD.DiscInfo.discType =
		//uBluray_DVD.DiscInfo.id = 
		
	    }
	    // TITLEINFO-2,--:--:--.--,-2147483648,1
	    ACTIVE (FIND_STRING(DATA.TEXT,'TITLEINFO-',1)): {
		REMOVE_STRING(DATA.TEXT,'TITLEINFO-',1)
		
	    }
	    // TRACKINFO-11,--:--:--.--,1
	    ACTIVE (FIND_STRING(DATA.TEXT,'TRACKINFO-',1)): {
		REMOVE_STRING(DATA.TEXT,'TRACKINFO-',1)
		
	    }
	}
    }
}

BUTTON_EVENT[dvTP1_Bluray,0] {//nBlurayBtns] {
    push: {
	send_string 0, "'to bdp: ', itoa(button.input.channel)"
	PULSE[vdvBluray,button.input.channel];
    }
}

DATA_EVENT[vdvAppleTV] {
    ONLINE: {
	send_string 0, "'AppleTV is Online'";
    }
    OFFLINE: {
	send_string 0, "'AppleTV is Offline'";
    }
    COMMAND: {
    
    SEND_STRING 0, "'from atv module ', DATA.TEXT"
    
	SELECT {
	    ACTIVE (FIND_STRING(DATA.TEXT,'COVERARTURL-',1)): {
		REMOVE_STRING(DATA.TEXT,'COVERARTURL-',1)
		
		SEND_COMMAND dvTP1_AppleTv,"'^RAF-ATV_Image,%P0%H192.168.1.149%A%Fcoverart.png%R1'"
		SEND_COMMAND dvTP1_AppleTv,"'^BBR-1,1,ATV_Image'"
	    }
	}
	SELECT {
	    ACTIVE (FIND_STRING(DATA.TEXT,'NAME-',1)): {
		REMOVE_STRING(DATA.TEXT,'NAME-',1)
		
		send_command dvTP1_AppleTv, "'^TXT-2,0,',DATA.TEXT"
	    }
	}
	SELECT {
	    ACTIVE (FIND_STRING(DATA.TEXT,'ARTIST-',1)): {
		REMOVE_STRING(DATA.TEXT,'ARTIST-',1)
		
		send_command dvTP1_AppleTv, "'^TXT-3,0,',DATA.TEXT"
	    }
	}
    }
}

BUTTON_EVENT[dvTP1_AppleTv,nAppleTVBtns] {
    push: {
	stack_var integer nButton;
	nButton = get_last(nAppleTVBtns);
	
	switch(nAppleTVBtns[nButton]) {
	    case 1: pulse[vdvAppleTV,44]		// menu
	    case 3: pulse[vdvAppleTV,45]		// up
	    case 4: pulse[vdvAppleTV,46]		// down
	    case 5: pulse[vdvAppleTV,49]		// select
	    case 6: pulse[vdvAppleTV,47]	 	// left
	    case 7: pulse[vdvAppleTV,48]		// right
	    case 15: pulse[vdvAppleTV,3]		// pause
	    case 16: pulse[vdvAppleTV,1]		// play
	    case 17: pulse[vdvAppleTV,2]		// stop
	    case 18: pulse[vdvAppleTV,6]		// fast forward
	    case 19: pulse[vdvAppleTV,7]		// rewind
	    case 20: pulse[vdvAppleTV,4]		// chapter forward
	    case 21: pulse[vdvAppleTV,5]		// chapter backwards
	}
    }
    hold[5]: {
	stack_var integer nButton;
	nButton = get_last(nAppleTVBtns);
	
	switch(nAppleTVBtns[nButton]) {
	    case 1: pulse[vdvAppleTV,300]		// menu hold
	    case 5: pulse[vdvAppleTV,301]		// list/select hold
	}
    }
}

DATA_EVENT[dvCableBox] {
    online: {
	send_command dvCableBox, "'XCHM-1'";	// <x><x><x><enter>
    }
}
BUTTON_EVENT[dvTP_CableBox,nCableBoxBtns]{
    PUSH: {
	stack_var integer temp;
	stack_var char cTemp;
	stack_var char cTempOriginal[3];
	
	temp = get_last(nCableBoxBtns);
	
	switch( nCableBoxBtns[temp] ) {
	    case STB_UP:
	    case STB_DOWN:
	    case STB_LEFT:
	    case STB_RIGHT:
	    case STB_PAGE_UP:
	    case STB_PAGE_DOWN:
	    case STB_REWIND:
	    case STB_FASTFORWARD: {
		TO[dvCableBox,nCableBoxBtns[temp]];
	    }
	    case STB_CLEAR: {
		//
		send_command dvTP_CableBox, "'^TXT-4,0,'";
		
		//
		sCableBox.cPresetTemp[1] = 0;
	    }
	    case STB_0:	// 0 = 10
	    case STB_1:
	    case STB_2:
	    case STB_3:
	    case STB_4:
	    case STB_5:
	    case STB_6:
	    case STB_7:
	    case STB_8:
	    case STB_9: {
		if(sCableBox.nPresetBeingEdited > 0) {
		    sCableBox.cPresetTemp[1] = "sCableBox.cPresetTemp[1],ITOA(nCableBoxBtns[temp] - 10)"
		    
		    send_command dvTP_CableBox, "'^TXT-4,0,',sCableBox.cPresetTemp[1]"; 
		}
		else {
		    pulse[dvCableBox,nCableBoxBtns[temp]];
		}
	    }
	    case STB_ENTER: {
		
		// setup new icon
		send_command dvTP1_TP_iPad, "'^BMF-',ITOA(sCableBox.nPresetBeingEdited),',0,%I ', ITOA(nCableBoxTVFavIcons[0])";	//"'^BMF-<variable text address range>,<button states range>,<data>'"
		
		// setup new preset
		sCableBox.nPresets[sCableBox.nPresetBeingEdited] = sCableBox.cPresetTemp[1];
		
		// show page
		send_command dvTP1_TP_iPad, "'^SSH-2000,[Input Controls]TV'";
		// hide page
		send_command dvTP1_TP_iPad, "'^SHD-2000,[Input Controls]TV- Keypad'";
		
		// clear which preset is being edited
		sCableBox.nPresetBeingEdited = 0;
		
		// clear the preset temp holder
		sCableBox.cPresetTemp[1] = 0;
	    }
	    default: {
		pulse[dvCableBox,nCableBoxBtns[temp]];
	    }
	}
	//send_string 0, "'pulse[',ITOA(dvCableBox.PORT),',',itoa(nCableBoxBtns[temp]),']'";
    }
}

BUTTON_EVENT[dvTP1_CableBoxChannels,nCableBoxPresetBtns]{
    PUSH: {
	stack_var integer temp;
	temp = get_last(nCableBoxPresetBtns);
	
	SEND_COMMAND dvCableBox,"'XCH',ITOA(sCableBox.nPresets[temp])";//     nCableBoxTVChannelBtns[temp]";
	
	// clear preset being edited flag
	sCableBox.nPresetBeingEdited = 0;
    }
    HOLD[5]: {
	stack_var integer temp;
	temp = get_last(nCableBoxPresetBtns);
	
	// track the preset being adjusted
	sCableBox.nPresetBeingEdited = temp;
	
	// send page change 
	send_command dvTP1_TP_iPad, "'^SSH-2000,[Input Controls]TV - Keypad'";
	//send_command dvTP1_TP_iPad, "'@PPN-[paneRight]TV'"; 	-- popup 
    }
}

///////////// Celia buttons
BUTTON_EVENT[dvTP1_TP_iPad,4000]{		// temp reset button for testing
    push:{
	send_string 0, "'reset all celia stuff'";
	
	sAppointment.sClient.cFirstName = '';
	sAppointment.sClient.cLastName = '';
	sAppointment.nSessionActive = 0;
	
	send_command dvTP1_TP_iPad, "'@PPX'";
	send_command dvTP1_TP_iPad, "'@PPN-Menu - New Session'";
	send_command dvTP1_TP_iPad, "'@PPN-Menu - Checkout'";
	send_command dvTP1_TP_iPad, "'@PPN-Menu - Schedule'";
	send_command dvTP1_TP_iPad, "'@PPN-Menu - Notes'";
	send_command dvTP1_TP_iPad, "'@PPN-Menu - Music types'";
	
	SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(NEW_CLIENT_FIRST_NAME_BTN),',0,',sAppointment.sClient.cFirstName";
	SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(NEW_CLIENT_LAST_NAME_BTN),',0,',sAppointment.sClient.cLastName";
    }
}

BUTTON_EVENT[dvTP1_Celia, nCeliaBtns]{
    push: {
	stack_var INTEGER nBtn
	
	stack_var char buffered_time[20];
	stack_var char hour[10];
	stack_var char minute[10];
	stack_var char second[10];
	
	stack_var integer nHour;
	stack_var integer nMinute;
	stack_var integer nSecond;
	
	
	nBtn = GET_LAST(nCeliaBtns);
	
	switch(nCeliaBtns[nBtn]){
	    case MENU_NEW_SESSION_BTN:{		// new appointment
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "New Sessions - Clients"
		send_command dvTP1_TP_iPad, "'@PPN-New Session - Clients'";
	    }
	    case NEW_SESSION_NEW_CLIENT_BTN:{		// new client
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "New Sessions - New Client"
		send_command dvTP1_TP_iPad, "'@PPN-New Session - New Client'";
	    }
	    case NEW_CLIENT_FIRST_NAME_BTN: {		// get first name
		// open keyboard
		SEND_COMMAND dvTP1_TP_iPad,"'@AKB-;First Name'";
		
		// setup keyboard processing
		editingFirstname = true;
	    }
	    case NEW_CLIENT_LAST_NAME_BTN: {		// get last name
		// open keyboard
		SEND_COMMAND dvTP1_TP_iPad,"'@AKB-;Last Name'";
		
		// setup keyboard processing
		editingLastname = true;
	    }
	    case NEW_SESSION_EXISTING_CLIENT_BTN: {		// existing client
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "New Sessions - Existing Client"
		send_command dvTP1_TP_iPad, "'@PPN-New Session - Existing Client'";
	    }
	    case MASSAGE_TYPE_SWEDISH_BTN: {		// massage type - swedish
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "New Sessions - Massage Type"
		send_command dvTP1_TP_iPad, "'@PPN-New Session - Massage Length'";
		
		// setup current message type
		sAppointment.nMassageType = MASSAGE_TYPE_SWEDISH;
	    }
	    case MASSAGE_TYPE_DEEP_TISSUE_BTN: {		// massage type - deep tissue
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "New Sessions - Massage Type"
		send_command dvTP1_TP_iPad, "'@PPN-New Session - Massage Length'";
		
		// setup current message type
		sAppointment.nMassageType = MASSAGE_TYPE_DEEP_TISSUE;
	    }
	    case MASSAGE_TYPE_PREGNACY_BTN: {		// massage type - pregnacy
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "New Sessions - Massage Type"
		send_command dvTP1_TP_iPad, "'@PPN-New Session - Massage Length'";
		
		// setup current message type
		sAppointment.nMassageType = MASSAGE_TYPE_PREGNACY;
	    }
	    case MASSAGE_TYPE_HOT_STONE_BTN: {		// massage type - hot stone
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "New Sessions - Massage Type"
		send_command dvTP1_TP_iPad, "'@PPN-New Session - Massage Length'";
		
		// setup current message type
		sAppointment.nMassageType = MASSAGE_TYPE_HOT_STONE;
	    }
	    case MASSAGE_LENGTH_30_MINUTES_BTN: {		// massage length 30
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "Massage - Active"
		send_command dvTP1_TP_iPad, "'@PPN-Massage - Active'";
		
		// setup current message type
		sAppointment.nMassageLength = MASSAGE_LENGTH_30_MINUTES;
		
		// setup time text
		SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(MASSAGE_TIMER),',0,00:30:00'";
	    }
	    case MASSAGE_LENGTH_60_MINUTES_BTN: {		// massage length 60
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "Massage - Active"
		send_command dvTP1_TP_iPad, "'@PPN-Massage - Active'";
		
		// setup current message type
		sAppointment.nMassageLength = MASSAGE_LENGTH_60_MINUTES;
		
		// setup time text
		SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(MASSAGE_TIMER),',0,01:00:00'";
	    }
	    case MASSAGE_LENGTH_90_MINUTES_BTN: {		// massage length 90
		// hide all popups
		send_command dvTP1_TP_iPad, "'@PPX'";
		
		// show "Massage - Active"
		send_command dvTP1_TP_iPad, "'@PPN-Massage - Active'";
		
		// setup current message type
		sAppointment.nMassageLength = MASSAGE_LENGTH_90_MINUTES;
		
		// setup time text
		SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(MASSAGE_TIMER),',0,01:30:00'";
	    }
	    case MASSAGE_ACTIVE_START_BTN: {		// massage start
		// start timeline
		/*IF(sAppointment.nMassageLength == MASSAGE_LENGTH_30_MINUTES)
		    TIMELINE_CREATE(MASSAGE_LENGTH_30_MINUTES,TimeArray_1_Second,1,TIMELINE_RELATIVE,TIMELINE_ONCE);
		    
		IF(sAppointment.nMassageLength == MASSAGE_LENGTH_60_MINUTES)
		    TIMELINE_CREATE(MASSAGE_LENGTH_60_MINUTES,TimeArray_1_Second,1,TIMELINE_RELATIVE,TIMELINE_ONCE);
		    
		IF(sAppointment.nMassageLength == MASSAGE_LENGTH_90_MINUTES)
		    TIMELINE_CREATE(MASSAGE_LENGTH_90_MINUTES,TimeArray_1_Second,1,TIMELINE_RELATIVE,TIMELINE_ONCE);
		    */
		sAppointment.nSessionActive = true;
		sAppointment.cDate = DATE;
		sAppointment.cTime = TIME;
		getClientInfo();
		
		send_string 0, "'TIME is: ', TIME"; 
		
		buffered_time = TIME;
		hour = MID_STRING(buffered_time, 1, 2);
		minute = MID_STRING(buffered_time, 4, 2);
		second = MID_STRING(buffered_time, 7, 2);
		
		nHour = atoi(hour);
		sStartTime.nHours = nHour;
		nMinute = atoi(minute);
		sStartTime.nMinutes = nMinute;
		nSecond = atoi(second);
		sStartTime.nSeconds = nSecond;
		
		if(sAppointment.nMassageLength == MASSAGE_LENGTH_30_MINUTES){
		    send_string 0,"'add 30 minutes'";
		    nMinute = nMinute + 30;
		    if(nMinute >= 60){
			nHour = nHour + 1;
			nMinute = nMinute - 60;
		    }
		}
		else if(sAppointment.nMassageLength == MASSAGE_LENGTH_60_MINUTES){
		    send_string 0,"'add 60 minutes'";
		    nHour = nHour + 1;
		}
		else if(sAppointment.nMassageLength == MASSAGE_LENGTH_90_MINUTES){
		    send_string 0,"'add 90 minutes'";
		    nHour = nHour + 1;
		    nMinute = nMinute + 30;
		    if(nMinute >= 60){
			nHour = nHour + 1;
			nMinute = nMinute - 60;
		    }
		}
		
		sEndTime.nHours = nHour;
		sEndTime.nMinutes = nMinute;
		sEndTime.nSeconds = nSecond;
		
		// 20:58:24 now
		// setup 00:30:00
		// add 20:58:24 + 00:30:00
		// compare current time to added time
		send_string 0, "'>hour is ', itoa(nHour)";
		send_string 0, "'>minute is ', itoa(nMinute)";
		send_string 0, "'>second is ', itoa(nSecond)";
	    }
	}
    }
}

TIMELINE_EVENT[MASSAGE_TIMELINE]{
    stack_var char cTime[10];
    stack_var integer nHours;
    stack_var integer nMinutes;
    stack_var integer nSeconds;
    
    nHours = sAppointment.sRemaingingTime.nHours;
    nMinutes = sAppointment.sRemaingingTime.nMinutes;
    nSeconds = sAppointment.sRemaingingTime.nSeconds;
    
    //send_string 0, "'in timeline'";
    
    if((sAppointment.nMassageLength == MASSAGE_LENGTH_30_MINUTES) && (sAppointment.nSessionActive == true)){ // 00:30:00 -> 00:29:59
	if(nSeconds == 0){
	    nSeconds = 59;
	    if(nMinutes == 0){
		nMinutes = 59;
		if(nHours == 0){
		    nHours = 23;
		}
		if(nHours > 0){
		    nHours = nHours - 1;
		}
	    }
	    if(nMinutes > 0){
		nMinutes = nMinutes - 1;
	    }
	}
	if(nSeconds > 0){
	    nSeconds = nSeconds - 1;
	}
	
	cTime = "itoa(nHours), ':', itoa(nMinutes), ':', itoa(nSeconds)";
	
	SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(MASSAGE_TIMER),',0,',cTime";
    }
}

TIMELINE_EVENT[MASSAGE_LENGTH_30_MINUTES]{
    //SEND_COMMAND dvTP1_Celia,"'^TXT-',itoa(MASSAGE_TIMER),',0,',ITOA(TIMELINE_GET(MASSAGE_LENGTH_30_MINUTES))";
    //SEND_STRING 0,"'Timer Time is ',ITOA(TIMELINE_GET(MASSAGE_LENGTH_30_MINUTES))";
}

TIMELINE_EVENT[MASSAGE_LENGTH_60_MINUTES]{

}

TIMELINE_EVENT[MASSAGE_LENGTH_90_MINUTES]{

}
//////////////////////////////

(***********************************************************)
(*            THE ACTUAL PROGRAM GOES BELOW                *)
(***********************************************************)
DEFINE_PROGRAM

[dvTP1_Celia,MASSAGE_ACTIVE_START_BTN] = (sAppointment.nSessionActive);


//bluray
[dvTP1_Bluray,_PLAY] = [vdvBluray,241]
[dvTP1_Bluray,_STOP] = ([vdvBluray,242] && [vdvBluray,255])
[dvTP1_Bluray,_PAUSE] = [vdvBluray,243]
[dvTP1_Bluray,_SCAN_FWD] = [vdvBluray,246]
[dvTP1_Bluray,_SCAN_REV] = [vdvBluray,247]
[dvTP1_Bluray,_POWER] = [vdvBluray,255]


(***********************************************************)
(*                     END OF PROGRAM                      *)
(*        DO NOT PUT ANY CODE BELOW THIS COMMENT           *)
(***********************************************************)