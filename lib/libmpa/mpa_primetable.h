/*
 * Copyright (c) 2014, STMicroelectronics International N.V.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef GUARD_PRIMETABLE_H
#define GUARD_PRIMETABLE_H

#include <stdint.h>

/* Primes Number Table
 * All numbers up to 49999 are represented
 * by a bit in the following array.
 * A 0 means composite and a 1 mean a prime.
 * For an odd number 3<= n <= 49999 we can find out
 * if n is a prime by doing:
 *  n = (n-3)>>1;
 *     IsPrime = (PRIME_TABLE[n>>5] >> (n & 0x1f)) & 0x1) == 1;
 * E.i., the primality of each odd number is stored as a bit.
 */
const uint32_t MAX_TABULATED_PRIME = 49999;
const uint32_t NR_STORED_PRIMES = 5133;
const uint32_t PRIME_TABLE[782] = {
	0x325a65b7, 0x40b6894d, 0xc3252619, 0x90cb4106, 0x2d021a64, 0x5244b090,
	    0x94c308a2, 0x25144168,
	0x99212018, 0x841a4c90, 0x21128325, 0x8a452442, 0x36182102, 0x05a05a04,
	    0x09288450, 0x32824494,
	0x4026184c, 0xc009224b, 0xa0892110, 0x60108264, 0x004c1699, 0x84022480,
	    0x41344b40, 0x110412d8,
	0xa05144a4, 0x4802132c, 0x1821a003, 0x34804922, 0x04044108, 0x092086d2,
	    0x12006030, 0x04309169,
	0xc10d8242, 0x00886980, 0x60225001, 0x0a48b011, 0x02532006, 0x04904a69,
	    0x0029104a, 0x26510804,
	0x2880c100, 0xd2458408, 0xa2184d12, 0x01a60840, 0x40291281, 0x10422484,
	    0x0c001928, 0x1208a051,
	0x80c20094, 0x0520d000, 0x1b002289, 0x94930004, 0x6030c141, 0x88080240,
	    0x24110036, 0x6106132c,
	0x1244a408, 0x22902c10, 0x0c801244, 0x08601281, 0x008a0434, 0x40141965,
	    0x13258200, 0x30480980,
	0x6812c041, 0x19080080, 0x90c32186, 0x21840008, 0x08240212, 0x80494806,
	    0x00169021, 0x12440483,
	0x84996020, 0x29804104, 0xcb400440, 0x200040a0, 0x04240824, 0x902c244b,
	    0x10406194, 0x49304a01,
	0x11409000, 0x02d00822, 0x2480c820, 0x00050210, 0xa41a4492, 0x60164009,
	    0x920014c1, 0x04000422,
	0x29021b4c, 0x02680242, 0x22484500, 0x0c329941, 0x81050048, 0x14012000,
	    0x49025220, 0x43088218,
	0x16002104, 0x64840229, 0x89243042, 0x22124c84, 0x01801200, 0x8800108a,
	    0x02990d00, 0x20201044,
	0x42618483, 0x301800a0, 0x08b4010c, 0x51010648, 0x94c30002, 0x41120a44,
	    0x40042081, 0x04400c82,
	0x21340908, 0x81000252, 0x06030830, 0x09008008, 0xca019008, 0x32892110,
	    0x05064a0c, 0x8a009402,
	0x20520514, 0x00a00068, 0x90208248, 0xa4412016, 0x08001060, 0x12040098,
	    0x12422c82, 0x41148100,
	0x012c3080, 0x240b40a4, 0x08908008, 0x50650003, 0x82000120, 0x21005848,
	    0x83408602, 0x128a2404,
	0x08929049, 0x43050050, 0x24016086, 0x04229000, 0x034c0019, 0x00110982,
	    0x40a40241, 0x0941220a,
	0xa0080c12, 0x68144021, 0x12409002, 0x96006c32, 0x20840904, 0x81000051,
	    0x20906520, 0x0c008860,
	0x520c0252, 0x904a0910, 0x01205041, 0x02402219, 0x06000c00, 0x45304320,
	    0x89443200, 0x00410082,
	0x6080d125, 0x8204b088, 0xb0004400, 0x04205a00, 0x40018083, 0x024a2004,
	    0x40149045, 0x81290601,
	0x00422100, 0x01324240, 0x18002419, 0x10912022, 0x61840100, 0x10680250,
	    0x200b0c20, 0x29140020,
	0x8a410448, 0x84080c00, 0x05204104, 0x40499050, 0x10006004, 0x00828029,
	    0x0308a008, 0x80004106,
	0x4d224825, 0x48401400, 0x84832502, 0x00140121, 0x800c009a, 0xa24004b2,
	    0x01120001, 0x8a2430c1,
	0x14090020, 0x28841a00, 0x48090282, 0x30424494, 0x08248809, 0x4124a013,
	    0x00884880, 0x44201205,
	0x02082608, 0x16512800, 0x05244820, 0x092800d8, 0x82520004, 0x49145004,
	    0x88218001, 0xa0900110,
	0x04001940, 0x80290602, 0x10422490, 0x40808108, 0x91202408, 0xb4c20080,
	    0x64009860, 0x00442201,
	0x16810086, 0x00308960, 0x18600050, 0x840900a0, 0x40001005, 0x4200a04a,
	    0x00190020, 0x05804208,
	0x83008012, 0x20c24514, 0x04040840, 0xc001a64a, 0xa04b2000, 0x28101020,
	    0x51449291, 0x10522020,
	0x00944301, 0x08251090, 0x040a0004, 0x21128220, 0x08219081, 0x90804902,
	    0x0c265008, 0xc2018491,
	0x020844a0, 0x00921141, 0x4204040a, 0x04806084, 0x4520d821, 0x1b400001,
	    0x92502482, 0x01000048,
	0x814920ca, 0x84030400, 0x68008004, 0x4044940b, 0xb4000030, 0x28064800,
	    0x40200090, 0x20982120,
	0x40929000, 0x0024a003, 0x24890084, 0x0c105000, 0x53008298, 0x14120800,
	    0x64100100, 0x09440010,
	0x00494806, 0x21009301, 0x0200248b, 0x00812112, 0x0d064044, 0x00080440,
	    0x224a0130, 0x08b48044,
	0x50090418, 0x00420992, 0x60328041, 0x18001408, 0x80900182, 0x64008308,
	    0x10610040, 0x86410804,
	0x29060109, 0xd8002003, 0x00882030, 0x0802434c, 0x0a490442, 0x20c020b0,
	    0x4082080d, 0x9020a011,
	0x20802914, 0x08301a04, 0x08009400, 0x04420020, 0x24104821, 0x01290202,
	    0x02100400, 0x0006c100,
	0x88012041, 0xa0102402, 0x0080004c, 0x00601203, 0x10824134, 0x04220809,
	    0x53200002, 0x848b6810,
	0x01209264, 0x49048610, 0x00000920, 0x21848020, 0x814c1042, 0x80120880,
	    0x01801221, 0x18208448,
	0x26102c12, 0x08044140, 0x83409292, 0x100804a0, 0x4022080c, 0x92250008,
	    0x144a0086, 0x60001840,
	0x42083001, 0x04800106, 0x0400c101, 0x10610208, 0x020304b4, 0x0880000c,
	    0x88058448, 0x06014110,
	0x00045b08, 0x81208013, 0x10922500, 0x4012100d, 0x80012200, 0x80012016,
	    0x08104a45, 0x53481000,
	0x960009a0, 0x00b0c308, 0x010820c0, 0x24184082, 0x28141024, 0x084510c0,
	    0x04880402, 0x21240808,
	0x49410650, 0x02906030, 0x00a01069, 0xc1040200, 0x00014116, 0x2420c024,
	    0x02488008, 0x00420182,
	0x00340261, 0x11603200, 0xa2190420, 0x48804304, 0x00009401, 0x12002432,
	    0x21804808, 0xc3291080,
	0x104845a0, 0x44041020, 0x1009a202, 0xb0420100, 0x20124840, 0x08040018,
	    0x00810404, 0x21900208,
	0x0948205a, 0x264000b4, 0x6004000c, 0x08202489, 0xa0800d12, 0x08261244,
	    0x88290200, 0x20902504,
	0x08b49124, 0x0308040a, 0x14424012, 0x20000800, 0x13040088, 0x14032404,
	    0x21008a00, 0x10050242,
	0x04410080, 0x09124100, 0x50202002, 0x02084820, 0x08201148, 0x08401610,
	    0x02002194, 0x4080802c,
	0x9004a408, 0x00024190, 0x00225221, 0x50083600, 0x80402422, 0x64a44041,
	    0x81000000, 0x82580802,
	0x08148209, 0x02042049, 0x80114122, 0x0c80100c, 0x48408090, 0x20804530,
	    0x08228160, 0xd1010002,
	0x90882004, 0x21009024, 0x0a001618, 0x021100a2, 0x44844901, 0x88401082,
	    0xa0100082, 0x00024020,
	0x58200489, 0x00992c32, 0x20804804, 0xc0608482, 0x00480430, 0x0092004d,
	    0x93010409, 0x04034102,
	0x24100004, 0x120c0010, 0x800101a4, 0x00048008, 0x882500c2, 0x02004c00,
	    0x6000430c, 0x40409000,
	0x02980802, 0x25065a00, 0x014894c1, 0x22100014, 0x48960060, 0x5100a040,
	    0x84820900, 0x04001061,
	0x11080601, 0x96000002, 0x60004308, 0x19090000, 0x204044a0, 0x28028120,
	    0x52413043, 0x26890530,
	0x09044840, 0x0a0104c0, 0x101200a4, 0x48220045, 0x01008202, 0x00096880,
	    0x00200205, 0x12409099,
	0x10420c84, 0x44840201, 0x01011240, 0x22410c34, 0x20108021, 0xc0009400,
	    0xa0104122, 0x01064008,
	0xc8201200, 0x10102000, 0x0c941028, 0x1004a000, 0x30024004, 0x04104020,
	    0x1a04a498, 0x12120880,
	0x61208041, 0x01490200, 0x06004012, 0x00805001, 0x8220b003, 0x80806810,
	    0x09240000, 0x09488242,
	0x22120004, 0x0c208900, 0x40208613, 0x90022900, 0x48120004, 0x010c2410,
	    0x04d10180, 0x45000a68,
	0x002512c2, 0x200a4c10, 0x0002d100, 0x8a200000, 0x16102c00, 0x04804240,
	    0x01489010, 0x20d80104,
	0x04801804, 0x810c0008, 0x00010110, 0x04221200, 0x59003009, 0x06010922,
	    0x64204060, 0x90280210,
	0x82580002, 0x29948205, 0x18243080, 0x14904100, 0x29800b00, 0x08219011,
	    0x02400024, 0x00200069,
	0xc001a251, 0x04020014, 0x20320260, 0x42049418, 0x10c02822, 0x60004901,
	    0x11443008, 0x00004004,
	0x4182420c, 0x9040804b, 0x22800102, 0x28804244, 0xc3289010, 0x004a25a0,
	    0x08840040, 0x402c2610,
	0x90030182, 0x04028044, 0x00480291, 0x04c10020, 0x00000028, 0x106120d0,
	    0x040b0004, 0x68109320,
	0xc8408448, 0x22010020, 0x05060804, 0x024804c3, 0x02506400, 0x44901804,
	    0x11088042, 0x04002016,
	0x2400d801, 0x10048081, 0x00020182, 0x21300140, 0x08251098, 0x800104a2,
	    0x09001200, 0x524010c1,
	0x82010810, 0x0c205048, 0x83010002, 0x028004b4, 0x0000812c, 0x00002400,
	    0x10490180, 0x64009a00,
	0x18042410, 0x90402104, 0x00b44848, 0x81092002, 0x84090030, 0x08805000,
	    0x02241082, 0x86004912,
	0x00024200, 0x4b090080, 0x20d000a0, 0x44141144, 0x40212200, 0x008a0912,
	    0x0d304821, 0x08408208,
	0x94830424, 0x01200141, 0x88403212, 0x20084002, 0x21040101, 0x100480c2,
	    0xb0002802, 0x09a01808,
	0x80408201, 0x22900404, 0x48308825, 0x81040613, 0x30004890, 0x01000201,
	    0x03040600, 0x84422404,
	0x40000108, 0x102d0052, 0x02024400, 0x00048001, 0x0a24840a, 0x82006410,
	    0x2ca05048, 0x08090040,
	0x32c04000, 0x00020000, 0x800ca040, 0x30420190, 0x0d120260, 0x40403089,
	    0x04820104, 0x04100921,
	0x9048021a, 0x80500080, 0x48840005, 0x1a012049, 0xb0884420, 0x2000010c,
	    0x40601282, 0x10820434,
	0x00021140, 0x42008650, 0x04002090, 0x45100045, 0x02442400, 0x04410882,
	    0x2484c320, 0x88002052,
	0x02510080, 0x40064028, 0xd0412400, 0xa0890c00, 0x20a40200, 0x00009200,
	    0x000a4400, 0x00b40001,
	0x11250410, 0x80404184, 0x61008244, 0x1a000000, 0x14410002, 0x25208101,
	    0x814102c8, 0x82124004,
	0x49008020, 0x0a009440, 0x26102800, 0x21825808, 0x824810d2, 0x22000100,
	    0x04320024, 0x10210003,
	0x00c90104, 0x28100025, 0x11481299, 0x84000482, 0x0090c008, 0x19000288,
	    0x044a4404, 0x60869204,
	0x1005a040, 0x02090c20, 0x08201100, 0x41608293, 0x12180080, 0x04209101,
	    0x800d2412, 0x14096912,
	0x20020021, 0x01002098, 0x92100980, 0x44844268, 0x00290240, 0x00520c22,
	    0x48900300, 0x10210488,
	0x14182012, 0x20204200, 0x82080440, 0x20020404, 0x0c801104, 0x40000001,
	    0x90810116, 0x20104800,
	0x1a000600, 0x80902c24, 0x40100221, 0x8048000a, 0x000008b6, 0x01801020,
	    0x98442008, 0x32802502,
	0x0c041208, 0x40019442, 0x20582110, 0x0cb48800, 0x40000002, 0x80026102,
	    0x00028000, 0x4b041291,
	0x00110102, 0x00948868, 0x08043050, 0x220b0082, 0x01140108, 0x42202441,
	    0x14114810, 0x20000240,
	0xc0001202, 0x30080194, 0x40800024, 0x10288050, 0x80806886, 0x49021020,
	    0x49080000, 0x82822100,
	0x40204300, 0x90291008, 0x24080010, 0x68000105, 0x40242089, 0xa4000002,
	    0x00021104, 0x08218012,
	0x22000530, 0x04161009, 0xc2002210, 0x84032004, 0x40200060, 0x094c0010,
	    0x10510824, 0x60244200,
	0x09481008, 0x00414c04, 0x01825005, 0x00619400, 0x02082122, 0x00200204,
	    0x80080280, 0x02400190,
	0x08348944, 0x02040200, 0xa4420102, 0x0c100224, 0x18403201, 0x00010084,
	    0x04248929, 0x08442090,
	0x801a0424, 0x6802c300, 0xc2418000, 0x20812010, 0x20244008, 0x00289051,
	    0x00802480, 0x0c201048,
	0x91012001, 0x04402002, 0x0c100841, 0x41008280, 0x82002c20, 0x0094c840,
	    0x11003250, 0x005100a0,
	0x0006820c, 0x4a403000, 0x06884130, 0x09061840, 0x09000010, 0x10906020,
	    0x0820812c, 0x0101a240,
	0x14c80982, 0x60220004, 0x13001080, 0x80c00d00, 0x05100a09, 0x9900100a,
	    0x20000430, 0x40049021,
	0x40408083, 0x34002130, 0x21044148, 0xc0010240, 0x00020584, 0x0000004c
};

#endif /* include guard */