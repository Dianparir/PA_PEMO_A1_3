import 'package:flutter/material.dart';

//facial
class DetailTreatmentPage1 extends StatefulWidget {
  const DetailTreatmentPage1({super.key});

  @override
  State<DetailTreatmentPage1> createState() => _DetailTreatmentPage1State();
}

class _DetailTreatmentPage1State extends State<DetailTreatmentPage1> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            height: heightScreen,
            width: widthScreen / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
              color: Color.fromARGB(255, 236, 123, 176),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      'Facial Treatment ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/facial.png"),
                    radius: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Facial adalah metode perawatan untuk kulit wajah yang meliputi pengelupasan kulit dan menghilangkan kotoran serta sel-sel kulit mati. Dengan begitu, tampilan wajah menjadi lebih segar, halus, dan cerah.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Facial bisa memberikan manfaat berupa',
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '1.  Membersihkan kotoran',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '2. Mengencangkan kulit',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '3. Menghilangkan sel kulit mati',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '4. Menghilangkan kantung mata',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '5. Mengurangi pigmentasi',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '6. Melawan tanda penuaan dini',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '7. Meningkatkan penyerapan kulit dalam menyerap produk skincare',
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Booking Now   ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Icon(
                          Icons.forward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          // BookingPage(namaTreatment: "facial");
                          Navigator.pushNamed(context, '/bookingPage');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//body massage and Spa
class DetailTreatmentPage2 extends StatefulWidget {
  const DetailTreatmentPage2({super.key});

  @override
  State<DetailTreatmentPage2> createState() => _DetailTreatmentPage2State();
}

class _DetailTreatmentPage2State extends State<DetailTreatmentPage2> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            height: heightScreen,
            width: widthScreen / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
              color: Color.fromARGB(255, 236, 123, 176),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      'Body Massage and Spa ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/body-massage.png"),
                    radius: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Body spa bekerja dengan cara memberikan tekanan dan pijatan pada tubuh baik melalui alat bantu maupun secara manual. Body Massage and Spa benar-benar dapat meningkatkan relaksasi dan kesehatan tubuh serta pikiran.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Manfaat dari body massage',
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '1.  Mengatasi Depresi dan Anxiety Syndrome',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '2. Mengatur Tekanan Darah Supaya Lebih Baik',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '3. Meningkatkan Sistem Imun Dalam Tubuh',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '4. Membuat Tidur Lebih Nyenyak',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '5. Membantu Kinerja Jantung Untuk Memperlancar Aliran Darah',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Booking Now   ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Icon(
                          Icons.forward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          // BookingPage(namaTreatment: "body massage");
                          Navigator.pushNamed(context, '/bookingPage');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//waxing
class DetailTreatmentPage3 extends StatefulWidget {
  const DetailTreatmentPage3({super.key});

  @override
  State<DetailTreatmentPage3> createState() => _DetailTreatmentPage3State();
}

class _DetailTreatmentPage3State extends State<DetailTreatmentPage3> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            height: heightScreen,
            width: widthScreen / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
              color: Color.fromARGB(255, 236, 123, 176),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      'Waxing ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/waxing.png"),
                    radius: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Waxing merupakan proses semi permanen untuk menghilangkan rambut halus dari akar dan dilakukan untuk menghilangkan rambut yang tidak diinginkan dari hampir semua bagian tubuh termasuk alis, wajah, kaki, lengan, punggung, perut, kaki dan area kemaluan.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Manfaat dari waxing',
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '1.  Bulu lebih lambat tumbuh',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '2. Angkat sel kulit mati',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '3. Atasi kulit kusam',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '4. Ubah tekstur rambut',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Booking Now   ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Icon(
                          Icons.forward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          // BookingPage(namaTreatment: "waxing");
                          Navigator.pushNamed(context, '/bookingPage');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//aromatherapy
class DetailTreatmentPage4 extends StatefulWidget {
  const DetailTreatmentPage4({super.key});

  @override
  State<DetailTreatmentPage4> createState() => _DetailTreatmentPage4State();
}

class _DetailTreatmentPage4State extends State<DetailTreatmentPage4> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            height: heightScreen,
            width: widthScreen / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
              color: Color.fromARGB(255, 236, 123, 176),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      'Aromatherapy ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/aromatherapy.png"),
                    radius: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Aromaterapi adalah salah satu pengobatan alternatif yang ditawarkan di Spa untuk mengubah suasana hati dan juga untuk kesehatan fisik yang biasanya melibatkan penggunaan minyak aromaterapi yang berasal dari tanaman.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Manfaat dari Aromatherapy untuk menunjang kesehatan tubuh',
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '1.  Relaksasi',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '2. Membuat tidur lebih berkualitas',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '3. Obat gangguan pernapasan',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '4. Meredakan peradangan dan nyeri',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '5. Mengurangi mual',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Booking Now   ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Icon(
                          Icons.forward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          // BookingPage(namaTreatment: "aromatherapy");
                          Navigator.pushNamed(context, '/bookingPage');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//mani pedi
class DetailTreatmentPage5 extends StatefulWidget {
  const DetailTreatmentPage5({super.key});

  @override
  State<DetailTreatmentPage5> createState() => _DetailTreatmentPage5State();
}

class _DetailTreatmentPage5State extends State<DetailTreatmentPage5> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            height: heightScreen,
            width: widthScreen / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
              color: Color.fromARGB(255, 236, 123, 176),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      'Manicure and Pedicure ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/manicure-padicure.png"),
                    radius: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Manicure adalah rangkaian perawatan kuku dan jari tangan serta kulit di sekitarnya. Sementara pedicure adalah perawatan untuk kuku dan jari kaki. Biasanya, rangkaian perawatan ini dilakukan sebelum melakukan nail art atau sekadar mengoleskan kuteks kuku. Tujuannya untuk membentuk kuku-kuku jari lebih cantik saat diaplikasikan kuteks maupun nail art.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Manfaat Manicure dan Pedicure untuk Kesehatan',
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '1.  Mengatasi kulit pecah-pecah',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '2. Melembapkan kulit',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '3. Meningkatkan sirkulasi darah',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '4. Bermanfaat untuk persendian',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '5. Terbebas dari infeksi jamur',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '6. Sarana relaksasi',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Booking Now   ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Icon(
                          Icons.forward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          // BookingPage(namaTreatment: "mani pedi");
                          Navigator.pushNamed(context, '/bookingPage');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//nail care
class DetailTreatmentPage6 extends StatefulWidget {
  const DetailTreatmentPage6({super.key});

  @override
  State<DetailTreatmentPage6> createState() => _DetailTreatmentPage6State();
}

class _DetailTreatmentPage6State extends State<DetailTreatmentPage6> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            height: heightScreen,
            width: widthScreen / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
              color: Color.fromARGB(255, 236, 123, 176),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      'Nail Care Treatment ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/nail-care.png"),
                    radius: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Nail care treatment adalah perawatan kuku khusus yang ditawarkan oleh spa kami. Kuku sudah menjadi salah satu bagian tubuh terpenting dalam mendukung penampilan saat ini. Perawatan kuku meliputi beberapa proses seperti pemangkasan, pelembab, perawatan, perawatan kutikula, pengaplikasian cat kuku dan berbagai terapi lainnya.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Manfaat Nail Care untuk Kesehatan',
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '1.  Merawat kutikula',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '2. Merapikan kuku',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '3. Merawat kulit kering di tangan dan kaki',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '4. Mengangkat sel kulit mati',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '5. Mengatasi berbagai keluhan di tangan dan kaki',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '6. Sarana relaksasi',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Booking Now   ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Icon(
                          Icons.forward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          // BookingPage(namaTreatment: "nail care");
                          Navigator.pushNamed(context, '/bookingPage');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//hair spa
class DetailTreatmentPage7 extends StatefulWidget {
  const DetailTreatmentPage7({super.key});

  @override
  State<DetailTreatmentPage7> createState() => _DetailTreatmentPage7State();
}

class _DetailTreatmentPage7State extends State<DetailTreatmentPage7> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: heightScreen,
        width: widthScreen,
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Container(
            alignment: Alignment.topLeft,
            height: heightScreen,
            width: widthScreen / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200)),
              color: Color.fromARGB(255, 236, 123, 176),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Text(
                      'Hair Spa and Hair Mask ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/hair-spa.png"),
                    radius: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Hair spa and hair mask adalah perawatan rambut yang ditawarkan oleh spa kami. Hair Spa dan Hair Mask yang ditawarkan di Day Spa ini dapat menghilangkan stres di kulit kepala, pijat bahu dan menutrisi serta memperbaiki masalah-masalah yang dialami pada rambut dan kulit kepala.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: Text(
                    'Manfaat Hair Spa and Hair Mask',
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '1.  Melembapkan rambut dan kulit kepala',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '2. Mengurangi ketombe',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '3. Mengatur produksi sebum pada kulit kepala',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '4. Mengatasi penyumbatan pori-pori kulit kepala',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '5. Meningkatkan sirkulasi darah pada kulit kepala',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '6. Menebalkan rambut',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    '7. Memberi efek relaksasi',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Booking Now   ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Icon(
                          Icons.forward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(253, 80, 146, 1),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          // BookingPage(namaTreatment: "hair spa");
                          Navigator.pushNamed(context, '/bookingPage');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
