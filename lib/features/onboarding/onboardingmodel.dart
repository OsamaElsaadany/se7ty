class Onboardingmodel {
  final String imagePath;
  final String title;
  final String description;

  Onboardingmodel({
    required this.imagePath,
    required this.title,
    required this.description,
  });}

  List<Onboardingmodel> onboardinglist = 
     [
      Onboardingmodel(
        imagePath: 'assets/images/on1.svg',
        title: 'ابحث عن دكتور متخصص',
        description:
            'اكتشف مجموعة واسعة من الاطباء الخبراءوالمتخصصين فى مختلف المجالات',
      ),
      Onboardingmodel(
        imagePath: 'assets/images/on2.svg',
        title: 'سهولة الحجز',
        description: 'احجز المواعيد بضغطة زر فى اى وقت وفى اى مكان',
      ),
      Onboardingmodel(
        imagePath: 'assets/images/on3.svg',
        title: 'امن وسرى',
        description: "كن مطمئنا لان خصوصيتك وامانك هما اهم اولوياتنا",
      ),
    ];
  

