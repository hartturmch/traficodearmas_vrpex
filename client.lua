local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_traficodearmas")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = -458.18
local CoordenadaY = -2274.55
local CoordenadaZ = 8.51
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 478.51, ['y'] = -1890.44, ['z'] = 26.09 },
	[2] = { ['x'] = 976.53, ['y'] = -1825.05, ['z'] = 31.15 },
	[3] = { ['x'] = 1200.32, ['y'] = -1384.76, ['z'] = 35.22 },
	[4] = { ['x'] = 1140.96, ['y'] = -776.02, ['z'] = 57.59 },
	[5] = { ['x'] = -561.63, ['y'] = 302.25, ['z'] = 83.17 },
	[6] = { ['x'] = -1151.40, ['y'] = -206.73, ['z'] = 37.95 },
	[7] = { ['x'] = -2091.83, ['y'] = -314.17, ['z'] = 13.02 },
	[8] = { ['x'] = -1608.39, ['y'] = -822.20, ['z'] = 10.04 },
	[9] = { ['x'] = -522.23, ['y'] = -1212.54, ['z'] = 18.18 },
	[10] = { ['x'] = -719.60, ['y'] = -933.34, ['z'] = 19.01 },
	[11] = { ['x'] = -314.40, ['y'] = -1472.76, ['z'] = 30.54 },
	[12] = { ['x'] = -75.83, ['y'] = -1763.12, ['z'] = 29.49 },
	[13] = { ['x'] = 490.07, ['y'] = -1312.75, ['z'] = 29.25 },
	[14] = { ['x'] = 717.47, ['y'] = -1089.01, ['z'] = 22.36 },
	[15] = { ['x'] = 1184.65, ['y'] = -334.11, ['z'] = 69.17 },
	[16] = { ['x'] = -744.50, ['y'] = -1503.57, ['z'] = 5.00 },
	[17] = { ['x'] = -500.49, ['y'] = -1636.86, ['z'] = 17.79},
	[18] = { ['x'] = -3179.89, ['y'] = 1051.80, ['z'] = 20.96},
	[19] = { ['x'] = 2741.15, ['y'] = 1506.35, ['z'] = 45.29},
	[20] = { ['x'] = 681.41, ['y'] = 1286.05, ['z'] = 360.29},
	[21] = { ['x'] = 170.91, ['y'] = 2790.52, ['z'] = 49.80},
	[22] = { ['x'] = -2187.53, ['y'] = 4249.52, ['z'] = 48.93},
	[23] = { ['x'] = 2706.56, ['y'] = 4127.11, ['z'] = 43.87},
	[24] = { ['x'] = 3373.27, ['y'] = 5183.62, ['z'] = 1.46},
	[25] = { ['x'] = -105.28, ['y'] = 6191.79, ['z'] = 36.19},
	[26] = { ['x'] = 3585.74, ['y'] = 3620.61, ['z'] = 43.53},
	[27] = { ['x'] = 1658.24, ['y'] = 2.82, ['z'] = 166.11},
	[28] = { ['x'] = 1487.63, ['y'] = 1128.54, ['z'] = 114.33},
	[29] = { ['x'] = 2060.38, ['y'] = 3173.93, ['z'] = 45.16},
	[30] = { ['x'] = 1443.48, ['y'] = 3748.75, ['z'] = 31.93},	
	[31] = { ['x'] = 1498.95, ['y'] = -2130.38, ['z'] = 76.14},
	[32] = { ['x'] = -1087.20, ['y'] = 479.49, ['z'] = 81.52},
	[33] = { ['x'] = -1215.48, ['y'] = 457.80, ['z'] = 91.97},
	[34] = { ['x'] = -1161.85, ['y'] = -1099.05, ['z'] = 2.17},
	[35] = { ['x'] = -1172.09, ['y'] = -1571.91, ['z'] = 4.66},
	[36] = { ['x'] = 127.27, ['y'] = -1283.83, ['z'] = 29.27},
	[37] = { ['x'] = -88.03, ['y'] = -83.05, ['z'] = 57.80},
	[38] = { ['x'] = -133.82, ['y'] = -1580.45, ['z'] = 37.40},
	[39] = { ['x'] = 85.82, ['y'] = -1959.35, ['z'] = 21.12},
	[40] = { ['x'] = 305.00, ['y'] = -2086.64, ['z'] = 17.70},
	[41] = { ['x'] = -1277.36, ['y'] = 496.79, ['z'] = 97.80},
	[42] = { ['x'] = -1380.82, ['y'] = 474.51, ['z'] = 105.05},
	[43] = { ['x'] = -1063.64, ['y'] = -1054.95, ['z'] = 2.15},
	[44] = { ['x'] = -1113.64, ['y'] = -1068.97, ['z'] = 2.15},
	[45] = { ['x'] = -64.48, ['y'] = -1450.00, ['z'] = 32.52},
	[46] = { ['x'] = -1087.92, ['y'] = -1671.92, ['z'] = 4.70},
	[47] = { ['x'] = 1286.81, ['y'] = -1604.55, ['z'] = 54.82},
	[48] = { ['x'] = -766.07, ['y'] = -917.12, ['z'] = 21.09},
	[49] = { ['x'] = 981.49, ['y'] = -1805.61, ['z'] = 35.48},
	[50] = { ['x'] = 852.84, ['y'] = -309.42, ['z'] = 64.95},
	[51] = { ['x'] = 793.37, ['y'] = -215.86, ['z'] = 65.61},
	[52] = { ['x'] = 768.42, ['y'] = -206.46, ['z'] = 70.12},
	[53] = { ['x'] = 652.29, ['y'] = -294.54, ['z'] = 48.61},
	[54] = { ['x'] = 1396.39, ['y'] = -768.17, ['z'] = 73.88},
	[55] = { ['x'] = 347.39, ['y'] = -1866.03, ['z'] = 30.84},
	[56] = { ['x'] = 381.48, ['y'] = -1823.88, ['z'] = 29.02},
	[57] = { ['x'] = 409.66, ['y'] = -1821.24, ['z'] = 31.42},
	[58] = { ['x'] = 454.44, ['y'] = -1741.43, ['z'] = 29.07},
	[59] = { ['x'] = 467.35, ['y'] = -1704.75, ['z'] = 32.74},
	[60] = { ['x'] = 276.54, ['y'] = -1941.73, ['z'] = 28.62},
	[61] = { ['x'] = 284.90, ['y'] = -1921.59, ['z'] = 33.66},
	[62] = { ['x'] = 1333.71, ['y'] = -115.22, ['z'] = 118.80},
	[63] = { ['x'] = 1494.11, ['y'] = -102.26, ['z'] = 147.33},
	[64] = { ['x'] = 1550.13, ['y'] = -82.77, ['z'] = 157.27},
	[65] = { ['x'] = 1851.74, ['y'] = -79.62, ['z'] = 188.69},
	[66] = { ['x'] = 2061.61, ['y'] = 3.63, ['z'] = 211.60},
	[67] = { ['x'] = 2326.62, ['y'] = 235.85, ['z'] = 197.90},
	[68] = { ['x'] = 2385.49, ['y'] = 394.49, ['z'] = 174.13},
	[69] = { ['x'] = 1841.74, ['y'] = 223.97, ['z'] = 166.68},
	[70] = { ['x'] = -87.32, ['y'] = 65.44, ['z'] = 71.49},
	[71] = { ['x'] = -309.73, ['y'] = 245.21, ['z'] = 87.55},
	[72] = { ['x'] = -31.33, ['y'] = -138.75, ['z'] = 56.92},
	[73] = { ['x'] = 132.56, ['y'] = -1717.49, ['z'] = 29.07},
	[74] = { ['x'] = 265.55, ['y'] = -1561.65, ['z'] = 28.99},
	[75] = { ['x'] = -50.46, ['y'] = -1567.36, ['z'] = 29.89},
	[76] = { ['x'] = -1421.62, ['y'] = -785.49, ['z'] = 21.42},
	[77] = { ['x'] = -1410.71, ['y'] = -593.08, ['z'] = 30.31},
	[78] = { ['x'] = -1110.65, ['y'] = -288.24, ['z'] = 37.57},
	[79] = { ['x'] = 923.75, ['y'] = -271.18, ['z'] = 67.74},
	[80] = { ['x'] = 933.58, ['y'] = -616.58, ['z'] = 57.30},
	[81] = { ['x'] = 1191.11, ['y'] = -1691.57, ['z'] = 35.83},
	[82] = { ['x'] = -628.77, ['y'] = 169.12, ['z'] = 61.14},
	[83] = { ['x'] = -716.99, ['y'] = 499.32, ['z'] = 109.27},
	[84] = { ['x'] = -406.27, ['y'] = 341.15, ['z'] = 108.71},
	[85] = { ['x'] = 561.95, ['y'] = 119.13, ['z'] = 98.04},
	[86] = { ['x'] = 399.72, ['y'] = 66.68, ['z'] = 97.97},
	[87] = { ['x'] = 260.03, ['y'] = 1.56, ['z'] = 79.52},
	[88] = { ['x'] = -711.20, ['y'] = -1028.79, ['z'] = 16.11},
	[89] = { ['x'] = -643.34, ['y'] = -1227.85, ['z'] = 11.54},
	[90] = { ['x'] = -668.13, ['y'] = -970.18, ['z'] = 22.34},
	[100] = { ['x'] = 474.51, ['y'] = -1775.03, ['z'] = 28.69},
	[101] = { ['x'] = 440.98, ['y'] = -1706.35, ['z'] = 29.32},
	[102] = { ['x'] = -1087.20, ['y'] = 479.49, ['z'] = 81.52},
	[103] = { ['x'] = -1215.48, ['y'] = 457.80, ['z'] = 91.97},
	[104] = { ['x'] = -1277.36, ['y'] = 496.79, ['z'] = 97.80},
	[105] = { ['x'] = -1380.82, ['y'] = 474.51, ['z'] = 105.05},
	[106] = { ['x'] = -1063.64, ['y'] = -1054.95, ['z'] = 2.15},
	[107] = { ['x'] = -1113.64, ['y'] = -1068.97, ['z'] = 2.15},
	[108] = { ['x'] = -1161.85, ['y'] = -1099.05, ['z'] = 2.17},
	[109] = { ['x'] = -107.13, ['y'] = -610.50, ['z'] = 35.67},
	[110] = { ['x'] = -563.97, ['y'] = 268.03, ['z'] = 82.52},
	[111] = { ['x'] = -597.91, ['y'] = -307.87, ['z'] = 34.44},
	[112] = { ['x'] = -1150.85, ['y'] = -1594.68, ['z'] = 3.86},
	[113] = { ['x'] = -230.55, ['y'] = -2048.74, ['z'] = 27.23},
	[114] = { ['x'] = -1040.90, ['y'] = -2718.84, ['z'] = 13.29},
	[115] = { ['x'] = -938.13, ['y'] = -2324.90, ['z'] = 6.32},
	[116] = { ['x'] = -1416.60, ['y'] = -527.60, ['z'] = 31.24},
	[117] = { ['x'] = -647.49, ['y'] = 41.03, ['z'] = 39.61},
	[118] = { ['x'] = -783.06, ['y'] = 292.72, ['z'] = 85.30},
	[119] = { ['x'] = 296.82, ['y'] = 175.70, ['z'] = 103.65},
	[120] = { ['x'] = 256.21, ['y'] = -377.49, ['z'] = 44.14},
	[121] = { ['x'] = -1610.41, ['y'] = -937.25, ['z'] = 8.25},
	[122] = { ['x'] = -797.59, ['y'] = -115.62, ['z'] = 37.47},
	[123] = { ['x'] = -1087.20, ['y'] = 479.49, ['z'] = 81.52},
	[124] = { ['x'] = -1215.48, ['y'] = 457.80, ['z'] = 91.97},
	[125] = { ['x'] = -1277.36, ['y'] = 496.79, ['z'] = 97.80},
	[126] = { ['x'] = -1380.82, ['y'] = 474.51, ['z'] = 105.05},
	[127] = { ['x'] = -1063.64, ['y'] = -1054.95, ['z'] = 2.15},
	[128] = { ['x'] = -1113.64, ['y'] = -1068.97, ['z'] = 2.15},
	[129] = { ['x'] = -1161.85, ['y'] = -1099.05, ['z'] = 2.17},
	[130] = { ['x'] = -2974.03, ['y'] = 482.67, ['z'] = 14.92},
	[131] = { ['x'] = 1705.57, ['y'] = 4799.57, ['z'] = 41.80},
	[132] = { ['x'] = -133.45, ['y'] = -1580.70, ['z'] = 34.20},
	[133] = { ['x'] = -1087.92, ['y'] = -1671.92, ['z'] = 4.70},
	[134] = { ['x'] = 2326.62, ['y'] = 235.85, ['z'] = 197.90},
	[135] = { ['x'] = 1286.81, ['y'] = -1604.55, ['z'] = 54.82},
	[136] = { ['x'] = 1396.39, ['y'] = -768.17, ['z'] = 73.88},
	[137] = { ['x'] = 1550.13, ['y'] = -82.77, ['z'] = 157.27},
	[138] = { ['x'] = 1841.74, ['y'] = 223.97, ['z'] = 166.68},
	[139] = { ['x'] = 1191.11, ['y'] = -1691.57, ['z'] = 35.83},
	[140] = { ['x'] = -668.13, ['y'] = -970.18, ['z'] = 22.34},
	[141] = { ['x'] = -1161.85, ['y'] = -1099.05, ['z'] = 2.17},
	[142] = { ['x'] = -230.55, ['y'] = -2048.74, ['z'] = 27.23},
	[143] = { ['x'] = -1040.90, ['y'] = -2718.84, ['z'] = 13.29},
	[144] = { ['x'] = -938.13, ['y'] = -2324.90, ['z'] = 6.32},
	[145] = { ['x'] = -1416.60, ['y'] = -527.60, ['z'] = 31.24},
	[146] = { ['x'] = -797.59, ['y'] = -115.62, ['z'] = 37.47},
	[147] = { ['x'] = -1087.20, ['y'] = 479.49, ['z'] = 81.52},
	[148] = { ['x'] = -1215.48, ['y'] = 457.80, ['z'] = 91.97},
	[149] = { ['x'] = -1277.36, ['y'] = 496.79, ['z'] = 97.80},
	[150] = { ['x'] = -1380.82, ['y'] = 474.51, ['z'] = 105.05},
	[151] = { ['x'] = -1063.64, ['y'] = -1054.95, ['z'] = 2.15},
	[152] = { ['x'] = -1221.21, ['y'] = -318.98, ['z'] = 37.16},
	[153] = { ['x'] = -2974.03, ['y'] = 482.67, ['z'] = 14.92},
	[154] = { ['x'] = 219.73, ['y'] = 205.29, ['z'] = 105.06},
	[155] = { ['x'] = 152.94, ['y'] = -1029.80, ['z'] = 28.86},
	[156] = { ['x'] = -1087.20, ['y'] = 479.49, ['z'] = 81.52},
	[157] = { ['x'] = -1215.48, ['y'] = 457.80, ['z'] = 91.97},
	[158] = { ['x'] = -1161.85, ['y'] = -1099.05, ['z'] = 2.17},
	[159] = { ['x'] = -1172.09, ['y'] = -1571.91, ['z'] = 4.66},
	[160] = { ['x'] = -64.48, ['y'] = -1450.00, ['z'] = 32.52},
	[157] = { ['x'] = -1087.92, ['y'] = -1671.92, ['z'] = 4.70},
	[158] = { ['x'] = 1286.81, ['y'] = -1604.55, ['z'] = 54.82},
	[159] = { ['x'] = -766.07, ['y'] = -917.12, ['z'] = 21.09},
	[160] = { ['x'] = 981.49, ['y'] = -1805.61, ['z'] = 35.48},
	[161] = { ['x'] = 852.84, ['y'] = -309.42, ['z'] = 64.95},
	[162] = { ['x'] = 793.37, ['y'] = -215.86, ['z'] = 65.61},
	[163] = { ['x'] = 768.42, ['y'] = -206.46, ['z'] = 70.121},
	[164] = { ['x'] = 652.29, ['y'] = -294.54, ['z'] = 48.61},
	[165] = { ['x'] = -1122.75, ['y'] = -1557.40, ['z'] = 5.4042},
	[166] = { ['x'] = -1134.71, ['y'] = -1568.79, ['z'] = 4.40},
	[167] = { ['x'] = -1155.83, ['y'] = -1574.05, ['z'] = 8.34},
	[168] = { ['x'] = -1165.08, ['y'] = -1586.68, ['z'] = 4.38},
	[169] = { ['x'] = -1167.65, ['y'] = -1584.0, ['z'] = 4.38},
	[170] = { ['x'] = -1170.94, ['y'] = -1579.11, ['z'] = 4.38},
	[171] = { ['x'] = -1174.64, ['y'] = -1574.52, ['z'] = 4.37},
	[172] = { ['x'] = -1177.52, ['y'] = -1568.80, ['z'] = 4.35},
	[173] = { ['x'] = -1182.70, ['y'] = -1561.23, ['z'] = 4.35},
	[174] = { ['x'] = -1183.07, ['y'] = -1556.66, ['z'] = 5.04},
	[175] = { ['x'] = -1187.78, ['y'] = -1554.96, ['z'] = 4.36},
	[176] = { ['x'] = -1150.75, ['y'] = -1519.55, ['z'] = 4.35},
	[177] = { ['x'] = -1148.41, ['y'] = -1523.61, ['z'] = 10.62},
	[178] = { ['x'] = -1150.05, ['y'] = -1521.91, ['z'] = 10.62},
	[179] = { ['x'] = -1142.77, ['y'] = -1520.96, ['z'] = 4.35},
	[180] = { ['x'] = -1224.71, ['y'] = -1486.89, ['z'] = 4.33},
	[181] = { ['x'] = -1221.72, ['y'] = -1469.42, ['z'] = 4.32},
	[182] = { ['x'] = -1210.85, ['y'] = -1461.79, ['z'] = 4.33},
	[183] = { ['x'] = -1218.86, ['y'] = -1433.79, ['z'] = 4.33},
	[184] = { ['x'] = -1226.94, ['y'] = -1438.63, ['z'] = 4.335},
	[185] = { ['x'] = -1251.65, ['y'] = -1449.44, ['z'] = 4.34},
	[186] = { ['x'] = -1256.72, ['y'] = -1441.53, ['z'] = 4.34},
	[187] = { ['x'] = -1259.35, ['y'] = -1438.79, ['z'] = 4.34},
	[188] = { ['x'] = -1268.53, ['y'] = -1421.75, ['z'] = 4.34},
	[189] = { ['x'] = -1276.20, ['y'] = -1410.94, ['z'] = 4.32},
	[190] = { ['x'] = -1273.68, ['y'] = -1382.22, ['z'] = 4.32},
	[191] = { ['x'] = -1298.82, ['y'] = -1378.19, ['z'] = 4.48},
	[192] = { ['x'] = -1332.69, ['y'] = -1215.29, ['z'] = 5.94},
	[193] = { ['x'] = -1321.30, ['y'] = -1169.59, ['z'] = 4.82},
	[194] = { ['x'] = -1289.11, ['y'] = -1116.65, ['z'] = 6.94},
	[195] = { ['x'] = -1275.61, ['y'] = -1139.54, ['z'] = 6.79},
	[196] = { ['x'] = -1270.92, ['y'] = -1148.55, ['z'] = 6.78},
	[197] = { ['x'] = -1241.73, ['y'] = -1208.17, ['z'] = 8.51},
	[198] = { ['x'] = -1244.07, ['y'] = -1240.08, ['z'] = 11.02},
	[199] = { ['x'] = -1168.39, ['y'] = -1267.17, ['z'] = 6.19},
	[200] = { ['x'] = -1038.80, ['y'] = -1397.64, ['z'] = 5.55},
	[201] = { ['x'] = -5.59, ['y'] = 30.47, ['z'] = 71.29},
	[202] = { ['x'] = -51.20, ['y'] = 52.56, ['z'] = 72.27},
	[203] = { ['x'] = -101.67, ['y'] = 45.80, ['z'] = 71.62},
	[204] = { ['x'] = -81.19, ['y'] = 91.37, ['z'] = 71.56},
	[205] = { ['x'] = -212.27, ['y'] = 133.35, ['z'] = 69.63},
	[206] = { ['x'] = -303.94, ['y'] = 103.36, ['z'] = 67.91},
	[207] = { ['x'] = -313.84, ['y'] = 105.63, ['z'] = 67.60},
	[208] = { ['x'] = -389.55, ['y'] = 139.00, ['z'] = 65.62},
	[209] = { ['x'] = -806.66, ['y'] = -97.08, ['z'] = 37.57},
	[210] = { ['x'] = -355.53, ['y'] = -28.17, ['z'] = 47.26},
	[211] = { ['x'] = 908.17, ['y'] = -2265.30, ['z'] = 30.64},
	[212] = { ['x'] = 1048.71, ['y'] = -2423.84, ['z'] = 30.30},
	[213] = { ['x'] = 1005.94, ['y'] = -2067.30, ['z'] = 31.1},
	[214] = { ['x'] = 894.48, ['y'] = -1730.09, ['z'] = 30.33},
	[215] = { ['x'] = 787.04, ['y'] = -1324.03, ['z'] = 26.07},
	[216] = { ['x'] = 775.82, ['y'] = -1054.89, ['z'] = 27.03},
	[217] = { ['x'] = 760.25, ['y'] = -732.10, ['z'] = 27.76},
	[218] = { ['x'] = 522.34, ['y'] = -162.59, ['z'] = 56.14},
	[219] = { ['x'] = 617.49, ['y'] = 70.49, ['z'] = 90.73},
	[220] = { ['x'] = 446.33, ['y'] = 131.26, ['z'] = 99.76},
	[221] = { ['x'] = -216.42, ['y'] = 276.42, ['z'] = 92.04},
	[222] = { ['x'] = -518.22, ['y'] = 270.36, ['z'] = 83.05},
	[223] = { ['x'] = -1249.96, ['y'] = 459.96, ['z'] = 93.49},
	[224] = { ['x'] = -1146.81, ['y'] = -1379.54, ['z'] = 4.86},
	[225] = { ['x'] = -1076.43, ['y'] = -1499.54, ['z'] = 5.10},
	[226] = { ['x'] = -1025.47, ['y'] = -1589.37, ['z'] = 5.16},
	[227] = { ['x'] = -1090.09, ['y'] = -1538.90, ['z'] = 4.52},
	[228] = { ['x'] = -1132.08, ['y'] = -1502.39, ['z'] = 4.38},
	[229] = { ['x'] = -1251.66, ['y'] = -1280.10, ['z'] = 3.99},
	[230] = { ['x'] = -1324.01, ['y'] = -1086.32, ['z'] = 6.95},
	[231] = { ['x'] = -1280.01, ['y'] = -642.26, ['z'] = 26.72},
	[232] = { ['x'] = -1237.54, ['y'] = -555.11, ['z'] = 28.85},
	[233] = { ['x'] = -1304.85, ['y'] = -317.67, ['z'] = 37.00},
	[234] = { ['x'] = -1388.69, ['y'] = -271.16, ['z'] = 43.11},
	[235] = { ['x'] = -768.64, ['y'] = 313.04, ['z'] = 85.69},
	[236] = { ['x'] = -634.50, ['y'] = 139.82, ['z'] = 57.23},
	[237] = { ['x'] = -623.54, ['y'] = -201.87, ['z'] = 37.45},
	[238] = { ['x'] = -617.12, ['y'] = -439.37, ['z'] = 34.76},
	[239] = { ['x'] = -162.29, ['y'] = -873.28, ['z'] = 29.23},
	[240] = { ['x'] = -766.75, ['y'] = 296.88, ['z'] = 85.66},
	[241] = { ['x'] = 308.27, ['y'] = 171.07, ['z'] = 103.94},
	[242] = { ['x'] = 425.90, ['y'] = 99.60, ['z'] = 100.21},
	[243] = { ['x'] = 142.54, ['y'] = -823.80, ['z'] = 31.14},
	[244] = { ['x'] = 115.45, ['y'] = -929.64, ['z'] = 29.84},
	[245] = { ['x'] = 245.75, ['y'] = -1065.43, ['z'] = 29.29},
	[246] = { ['x'] = 296.63, ['y'] = -1072.45, ['z'] = 29.40},
	[247] = { ['x'] = 392.63, ['y'] = -972.23, ['z'] = 29.44},
	[248] = { ['x'] = 433.24, ['y'] = -983.10, ['z'] = 30.71},
	[249] = { ['x'] = 379.89, ['y'] = -683.63, ['z'] = 29.25},
	[250] = { ['x'] = 294.75, ['y'] = -807.74, ['z'] = 29.44},
	[251] = { ['x'] = -188.88, ['y'] = -1425.62, ['z'] = 31.50},
	[252] = { ['x'] = -1168.01, ['y'] = -1478.40, ['z'] = 4.37},
	[253] = { ['x'] = -1294.20, ['y'] = -1163.08, ['z'] = 4.99},
	[254] = { ['x'] = -1366.10, ['y'] = -685.89, ['z'] = 25.10},
	[255] = { ['x'] = -254.03, ['y'] = 6149.25, ['z'] = 31.51},
	[256] = { ['x'] = 413.10, ['y'] = 6539.25, ['z'] = 27.73},
	[257] = { ['x'] = 770.05, ['y'] = 5578.29, ['z'] = 33.48},
	[258] = { ['x'] = 1736.97, ['y'] = 3290.91, ['z'] = 41.14},
	[259] = { ['x'] = 1954.24, ['y'] = 3843.53, ['z'] = 32.02},
	[260] = { ['x'] = 2516.32, ['y'] = 4203.18, ['z'] = 39.99},
	[261] = { ['x'] = 2906.71, ['y'] = 4407.69, ['z'] = 50.22},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(23,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,20,0,0,0,0)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA INICIAR COLETAS DE AÇO",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and emP.checkPermission() then
						servico = true
						selecionado = math.random(16)
						CriandoBlip(locs,selecionado)
						TriggerEvent("Notify","aviso","Vá até os lugares marcados no seu GPS para pegar os aços.")
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z+0.30,0,0,0,0,180.0,130.0,2.0,2.0,1.0,240,200,80,20,1,0,0,1)
				if distance <= 2.5 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA PEGAR O AÇO",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and emP.checkPermission() then
						if emP.checkPayment() then
							RemoveBlip(blips)
							backentrega = selecionado
							while true do
								if backentrega == selecionado then
									selecionado = math.random(16)
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			if IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coleta de Aço")
	EndTextCommandSetBlipName(blips)
end