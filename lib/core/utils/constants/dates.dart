class MonthModel{
  final String id;
  final String nameEn;
  final String nameAr;
  const MonthModel(this.id,this.nameEn,this.nameAr);
}

class YearModel{
  final String id;
  final String name;
  YearModel(this.id,this.name);
}

class Dates {

  static const List<MonthModel> miladyMonths = [
    MonthModel('1','January (1)','يناير (1)'),
    MonthModel('2','February (2)','فبراير (2)'),
    MonthModel('3','March (3)','مارس (3)'),
    MonthModel('4','April (4)','ابريل (4)'),
    MonthModel('5','may (5)','مايو (5)'),
    MonthModel('6','June (6)','يونيو (6)'),
    MonthModel('7','July (7)','يوليو (7)'),
    MonthModel('8','August (8)','أغسطس (8)'),
    MonthModel('9','September (9)','ستمبر (9)'),
    MonthModel('10','October (10)','أكتوبر (10)'),
    MonthModel('11','November (11)','نوفمبر (11)'),
    MonthModel('12','December (12)','ديسمبر (12)'),
  ];
  static const List<MonthModel> islamicMonths = [
    MonthModel('1','Muharram (1)','مُحرّم (1)'),
    MonthModel('2','Safar (2)','صفر (2)'),
    MonthModel('3','Rabei El Awal (3)','ربيع الأول (3)'),
    MonthModel('4','Rabei El Thany (4)','ربيع الثاني (4)'),
    MonthModel('5','Jumada Al Aula (5)','جُمادى الأولى (5)'),
    MonthModel('6','Jumada Al Akhar (6)','جُمادى الآخر (6)'),
    MonthModel('7','Ragab (7)','رجب (7)'),
    MonthModel('8','Shaaban (8)','شعبان(8)'),
    MonthModel('9','Ramadan (9)','رمضان (9)'),
    MonthModel('10','Shawwal (10)','شوال (10)'),
    MonthModel('11','Zul Qe\'da (11)','ذو القعدة(11)'),
    MonthModel('12','Zul Hejjah (12)','ذو الحجة(12)'),
  ];
}