class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/4.gif",
    title: "ต้นไม้สวยๆ",
    subTitle:
        "มีต้นไม้มากมายหลายประเภท\nง่ายต่อการค้นหา \n ",
  ),
  Items(
    img: "assets/5.gif",
    title: "ดูแลได้อย่างง่ายดาย",
    subTitle:
        "การดูแลต้นไม้เป็นเรื่องง่ายเพียงแค่คลิ๊ก",
  ),
  Items(
    img: "assets/6.gif",
    title: "สะดวกทุกที่ทุกเวลา",
    subTitle: "ทำให้การหาต้นไม้ง่ายขึ้น \n ทุกที่เพียงแค่มีมือถือ",
  ),
];
