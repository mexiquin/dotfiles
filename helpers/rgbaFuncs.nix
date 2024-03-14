rec {
  opacity_100 = "FF";
  opacity_90 = "E6";
  opacity_80 = "CC";
  opacity_70 = "B3";
  opacity_60 = "99";
  opacity_50 = "80";
  opacity_40 = "66";
  opacity_30 = "4D";
  opacity_20 = "33";
  opacity_10 = "1A";
  opacity_0 = "00";

  toRGBASolid = color: color + opacity_100;
  toRGBASemi = color: color + opacity_90;
  toRGBA = { color, opacity }: color + opacity;
}  
