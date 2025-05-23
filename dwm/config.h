/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx = 1; /* border pixel of windows */
static const unsigned int snap = 32;	/* snap pixel */
static const int showbar = 1;			/* 0 means no bar */
static const int topbar = 0;			/* 0 means bottom bar */
static const char *fonts[] = {"Noto Sans:size=11"};
static const char dmenufont[] = "Noto Sans:size=11";
static const char col_black1[] = "#000000";
static const char col_gray1[] = "#222222";
static const char col_gray2[] = "#444444";
static const char col_gray3[] = "#bbbbbb";
static const char col_gray4[] = "#eeeeee";
static const char col_gray5[] = "#262c36";
static const char col_cyan[] = "#005577";
static const char *colors[][3] = {
	/*               fg         bg         border   */
	[SchemeNorm] = {col_gray4, col_black1, col_black1},
	[SchemeSel] = {col_gray4, col_black1, col_black1},
};

static const char *const autostart[] = {
	"st", "-e", "zsh", "/home/yarlama/.config/tmux/tmux-start.sh", NULL,
    "amnezia-vpn", NULL,
	"google-chrome", NULL,
	"telegram", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = {"1", "2", "3", "4", "5", "6"};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance           title       tags mask     isfloating   monitor */
	{"Google-chrome", "google-chrome", NULL, 1 << 1, 0, -1},
  {"AmneziaVPN", "AmneziaVPN", NULL, 1 << 2, 0, -1},
	{"TelegramDesktop", "telegram", NULL, 1 << 4, 0, -1},
};

/* layout(s) */
static const float mfact = 0.55;	 /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;		 /* number of clients in master area */
static const int resizehints = 1;	 /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{"[]=", tile}, /* first entry is default */
	{"><>", NULL}, /* no layout function means floating behavior */
	{"[M]", monocle},
};

/* key definitions */
#define ESCAPE 0xff1b // escape
#define F2 0xffbf	  // f2
#define F3 0xffc0	  // f3
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                          \
	{MODKEY, KEY, view, {.ui = 1 << TAG}},                         \
		{MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}}, \
		{MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},          \
		{MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                           \
	{                                                        \
		.v = (const char *[]) { "/bin/sh", "-c", cmd, NULL } \
	}

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL};
static const char *termcmd[] = {"st", NULL};
static const char *volumeup[] = {"amixer", "-D", "pulse", "sset", "Master", "5%+", "unmute", NULL};
static const char *volumedown[] = {"amixer", "-D", "pulse", "sset", "Master", "5%-", "unmute", NULL};
static const char *shutdownpc[] = {"/usr/bin/sudo", "/usr/bin/bash", "/home/yarlama/.config/scripts/shutdown.sh", NULL};
static const char *rebootpc[] = {"/usr/bin/sudo", "/usr/bin/bash", "/home/yarlama/.config/scripts/reboot.sh", NULL};
static const char *dwmrebuild[] = {"/usr/bin/sudo", "/usr/bin/bash", "/home/yarlama/.config/scripts/dwmrecompile.sh", NULL};
static const char *slstatusrebuild[] = {"/usr/bin/sudo", "/usr/bin/bash", "/home/yarlama/.config/scripts/slstatusrecompile.sh", NULL};

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{MODKEY, XK_p, spawn, {.v = dmenucmd}},
	{MODKEY | ShiftMask, XK_Return, spawn, {.v = termcmd}},
	{MODKEY, F2, spawn, {.v = volumedown}},
	{MODKEY, F3, spawn, {.v = volumeup}},
	{MODKEY, ESCAPE, spawn, {.v = shutdownpc}},
	{MODKEY | ShiftMask, ESCAPE, spawn, {.v = rebootpc}},
	{MODKEY | ShiftMask, XK_d, spawn, {.v = dwmrebuild}},
	{MODKEY | ShiftMask, XK_s, spawn, {.v = slstatusrebuild}},
	{MODKEY, XK_b, togglebar, {0}},
	{MODKEY, XK_j, focusstack, {.i = +1}},
	{MODKEY, XK_k, focusstack, {.i = -1}},
	{MODKEY, XK_i, incnmaster, {.i = +1}},
	{MODKEY, XK_d, incnmaster, {.i = -1}},
	{MODKEY, XK_h, setmfact, {.f = -0.05}},
	{MODKEY, XK_l, setmfact, {.f = +0.05}},
	{MODKEY, XK_Return, zoom, {0}},
	{MODKEY, XK_Tab, view, {0}},
	{MODKEY | ShiftMask, XK_c, killclient, {0}},
	{MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
	{MODKEY, XK_f, setlayout, {.v = &layouts[1]}},
	{MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
	{MODKEY, XK_space, setlayout, {0}},
	{MODKEY | ShiftMask, XK_space, togglefloating, {0}},
	{MODKEY, XK_0, view, {.ui = ~0}},
	{MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
	{MODKEY, XK_comma, focusmon, {.i = -1}},
	{MODKEY, XK_period, focusmon, {.i = +1}},
	{MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
	{MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
	TAGKEYS(XK_1, 0)
		TAGKEYS(XK_2, 1)
			TAGKEYS(XK_3, 2)
				TAGKEYS(XK_4, 3)
					TAGKEYS(XK_5, 4)
						TAGKEYS(XK_6, 5){MODKEY | ShiftMask, XK_q, quit, {0}},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ClkLtSymbol, 0, Button1, setlayout, {0}},
	{ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
	{ClkWinTitle, 0, Button2, zoom, {0}},
	{ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
	{ClkClientWin, MODKEY, Button1, movemouse, {0}},
	{ClkClientWin, MODKEY, Button2, togglefloating, {0}},
	{ClkClientWin, MODKEY, Button3, resizemouse, {0}},
	{ClkTagBar, 0, Button1, view, {0}},
	{ClkTagBar, 0, Button3, toggleview, {0}},
	{ClkTagBar, MODKEY, Button1, tag, {0}},
	{ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
