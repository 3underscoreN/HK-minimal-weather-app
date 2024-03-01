enum Location {
  kingsPark,
  hko,
  wongChukHang,
  taKwuLing,
  lauFauShan,
  taiPo,
  shaTin,
  tuenMun,
  tko,
  saiKung,
  cheungChau,
  chepLapKok,
  tsingYi,
  shekKong,
  tsuenWanHoKoon,
  tsuenWanShingMunValley,
  hongKongPark,
  shauKeiWan,
  kowloonCity,
  happyValley,
  wongTaiSin,
  stanley,
  kwunTong,
  shamShuiPo,
  kaiTakPark,
  yuenLongPark,
  taiMeiTuk,
}

Location? string2Location(String? location) {
  switch (location) {
    case 'King\'s Park':
      return Location.kingsPark;
    case 'Hong Kong Observatory':
      return Location.hko;
    case 'Wong Chuk Hang':
      return Location.wongChukHang;
    case 'Ta Kwu Ling':
      return Location.taKwuLing;
    case 'Lau Fau Shan':
      return Location.lauFauShan;
    case 'Tai Po':
      return Location.taiPo;
    case 'Sha Tin':
      return Location.shaTin;
    case 'Tuen Mun':
      return Location.tuenMun;
    case 'Tseung Kwan O':
      return Location.tko;
    case 'Sai Kung':
      return Location.saiKung;
    case 'Cheung Chau':
      return Location.cheungChau;
    case 'Chep Lap Kok':
      return Location.chepLapKok;
    case 'Tsing Yi':
      return Location.tsingYi;
    case 'Shek Kong':
      return Location.shekKong;
    case 'Tsuen Wan Ho Koon':
      return Location.tsuenWanHoKoon;
    case 'Hong Kong Park':
      return Location.hongKongPark;
    case 'Shau Kei Wan':
      return Location.shauKeiWan;
    case 'Kowloon City':
      return Location.kowloonCity;
    case 'Happy Valley':
      return Location.happyValley;
    case 'Wong Tai Sin':
      return Location.wongTaiSin;
    case 'Stanley':
      return Location.stanley;
    case 'Kwun Tong':
      return Location.kwunTong;
    case 'Sham Shui Po':
      return Location.shamShuiPo;
    case 'Kai Tak Runway Park':
      return Location.kaiTakPark;
    case 'Yuen Long Park':
      return Location.yuenLongPark;
    case 'Tai Mei Tuk':
      return Location.taiMeiTuk;
    case null:
      return null;
  }
  return null;
}

String location2Chinese(Location? location) {
  switch (location) {
    case Location.kingsPark:
      return '京士柏';
    case Location.hko:
      return '香港天文台';
    case Location.wongChukHang:
      return '黃竹坑';
    case Location.taKwuLing:
      return '打鼓嶺';
    case Location.lauFauShan:
      return '流浮山';
    case Location.taiPo:
      return '大埔';
    case Location.shaTin:
      return '沙田';
    case Location.tuenMun:
      return '屯門';
    case Location.tko:
      return '將軍澳';
    case Location.saiKung:
      return '西貢';
    case Location.cheungChau: 
      return '長洲';
    case Location.chepLapKok:
      return '赤鱲角';
    case Location.tsingYi:
      return '青衣';
    case Location.shekKong:
      return '石崗';
    case Location.tsuenWanHoKoon:
      return '荃灣可觀';
    case Location.tsuenWanShingMunValley:
      return '荃灣城門谷';
    case Location.hongKongPark:
      return '香港公園';
    case Location.shauKeiWan:
      return '筲箕灣';
    case Location.kowloonCity:
      return '九龍城';
    case Location.happyValley:
      return '跑馬地';
    case Location.wongTaiSin:
      return '黃大仙';
    case Location.stanley:
      return '赤柱';
    case Location.kwunTong:
      return '觀塘';
    case Location.shamShuiPo:
      return '深水埗';
    case Location.kaiTakPark:
      return '啟德跑道公園';
    case Location.yuenLongPark:
      return '元朗公園';
    case Location.taiMeiTuk:
      return '大美督';
    case null:
      return 'null';
  }
}

String location2String(Location? location) {
  switch (location) {
    case Location.kingsPark:
      return 'King\'s Park';
    case Location.hko:
      return 'Hong Kong Observatory';
    case Location.wongChukHang:
      return 'Wong Chuk Hang';
    case Location.taKwuLing:
      return 'Ta Kwu Ling';
    case Location.lauFauShan:
      return 'Lau Fau Shan';
    case Location.taiPo:
      return 'Tai Po';
    case Location.shaTin:
      return 'Sha Tin';
    case Location.tuenMun:
      return 'Tuen Mun';
    case Location.tko:
      return 'Tseung Kwan O';
    case Location.saiKung:
      return 'Sai Kung';
    case Location.cheungChau: 
      return 'Cheung Chau';
    case Location.chepLapKok:
      return 'Chek Lap Kok';
    case Location.tsingYi:
      return 'Tsing Yi';
    case Location.shekKong:
      return 'Shek Kong';
    case Location.tsuenWanHoKoon:
      return 'Tsuen Wan Ho Koon';
    case Location.tsuenWanShingMunValley:
      return 'Tsuen Wan Shing Mun Valley';
    case Location.hongKongPark:
      return 'Hong Kong Park';
    case Location.shauKeiWan:
      return 'Shau Kei Wan';
    case Location.kowloonCity:
      return 'Kowloon City';
    case Location.happyValley:
      return 'Happy Valley';
    case Location.wongTaiSin:
      return 'Wong Tai Sin';
    case Location.stanley:
      return 'Stanley';
    case Location.kwunTong:
      return 'Kwun Tong';
    case Location.shamShuiPo:
      return 'Sham Shui Po';
    case Location.kaiTakPark:
      return 'Kai Tak Runway Park';
    case Location.yuenLongPark:
      return 'Yuen Long Park';
    case Location.taiMeiTuk:
      return 'Tai Mei Tuk';
    case null:
      return 'null';
  }
}