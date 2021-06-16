class PreventModel {
  String image;
  String title;
  String text;

  PreventModel({
    this.image,
    this.title,
    this.text,
  });
}

List<PreventModel> list = [
  PreventModel(
    image: 'assets/wash_hands.png',
    title: 'การล้างมือ',
    text: 'ล้างมือบ่อยๆ โดยใช้สบู่และน้ำ หรือเจลล้างมือที่มีส่วนผสมหลักเป็นแอลกอฮอล์',
  ),
  PreventModel(
    image: 'assets/Picture11.png',
    title: 'รักษาระยะห่าง',
    text: 'รักษาระยะห่างที่ปลอดภัยจากผู้ที่ไอหรือจาม',
  ),
  PreventModel(
    image: 'assets/wear_mask.png',
    title: 'สวมหน้ากากอนามัย',
    text: 'สวมหน้ากากอนามัยเมื่อเว้นระยะห่างไม่ได้',
  ),
];