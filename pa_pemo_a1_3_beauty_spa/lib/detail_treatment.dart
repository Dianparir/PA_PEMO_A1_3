import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/booking_page.dart';
// import 'package:pa_pemo_a1_3_beauty_spa/home_page.dart';

class treatments {
  String treatment_name;
  String pngSrc;
  String description_tratments;
  String price;
  treatments(
    this.treatment_name, 
    this.pngSrc,
    this.description_tratments,
    this.price,
  );
}

class DetailTreatments extends StatefulWidget {
  final String treatment_name;
  final String pngSrc;
  final String description_tratments;
  final String price;
  DetailTreatments(
      {Key? key,
      required this.treatment_name,
      required this.pngSrc,
      required this.description_tratments,
      required this.price})
      : super(key: key);

  @override
  State<DetailTreatments> createState() => _DetailTreatmentsState();
}

class _DetailTreatmentsState extends State<DetailTreatments> {
  List <treatments> _TreatmensItem = [
    treatments("Facial Treatment ","assets/facial.png", '''Facial adalah metode perawatan untuk kulit wajah yang meliputi pengelupasan kulit dan menghilangkan kotoran serta sel-sel kulit mati. Dengan begitu, tampilan wajah menjadi lebih segar, halus, dan cerah. Facial bisa memberikan manfaat berupa membersihkan kotoran, mengencangkan kulit, menghilangkan sel kulit mati, menghilangkan kantung mata, mengurangi pigmentasi, melawan tanda penuaan dini, dan meningkatkan penyerapan kulit dalam menyerap produk skincare.''', "Start Form Rp50.000,00"),
    treatments("Body Massage and Spa ","assets/body-massage.png",'''Body spa bekerja dengan cara memberikan tekanan dan pijatan pada tubuh baik melalui alat bantu maupun secara manual. Body Massage and Spa benar-benar dapat meningkatkan relaksasi dan kesehatan tubuh serta pikiran. Manfaat dari body massage antara lain, mengatasi depresi dan Anxiety Syndrome, mengatur tekanan darah supaya lebih baik, meningkatkan sistem imun dalam tubuh, membuat tidur lebih nyenyak, serta membantu kinerja jantung untuk memperlancar aliran darah.''',"Start Form Rp200.000,00"),
    treatments("Waxing ","assets/waxing.png",'''Waxing merupakan proses semi permanen untuk menghilangkan rambut halus dari akar dan dilakukan untuk menghilangkan rambut yang tidak diinginkan dari hampir semua bagian tubuh termasuk alis, wajah, kaki, lengan, punggung, perut, kaki dan area kemaluan. Manfaat dari waxing adalah bulu lebih lambat tumbuh, angkat sel kulit mati, atasi kulit kusam, dan ubah tekstur rambut.''',"Start Form Rp100.000,00"),
    treatments("Aromatherapy ","assets/aromatherapy.png",'''Aromaterapi adalah salah satu pengobatan alternatif yang ditawarkan di Spa untuk mengubah suasana hati dan juga untuk kesehatan fisik yang biasanya melibatkan penggunaan minyak aromaterapi yang berasal dari tanaman. Beberapa manfaat dari Aromatherapy untuk menunjang kesehatan tubuh antara lain, relaksasi, membuat tidur lebih berkualitas, obat gangguan pernapasan, meredakan peradangan dan nyeri, serta mengurangi mual.''',"Start Form Rp275.000,00"),
    treatments("Manicure and Pedicure ","assets/manicure-padicure.png",'''Manicure adalah rangkaian perawatan kuku dan jari tangan serta kulit di sekitarnya. Sementara pedicure adalah perawatan untuk kuku dan jari kaki. Biasanya, rangkaian perawatan ini dilakukan sebelum melakukan nail art atau sekadar mengoleskan kuteks kuku. Tujuannya untuk membentuk kuku-kuku jari lebih cantik saat diaplikasikan kuteks maupun nail art. Manfaat Manicure dan Pedicure untuk Kesehatan ialah mengatasi kulit pecah-pecah, melembapkan kulit, meningkatkan sirkulasi darah, bermanfaat untuk persendian, terbebas dari infeksi jamur, dan sarana relaksasi.''',"Start Form Rp150.000,00"),
    treatments("Nail Care Treatment ","assets/nail-care.png",'''Nail care treatment adalah perawatan kuku khusus yang ditawarkan oleh spa kami. Kuku sudah menjadi salah satu bagian tubuh terpenting dalam mendukung penampilan saat ini. Perawatan kuku meliputi beberapa proses seperti pemangkasan, pelembab, perawatan, perawatan kutikula, pengaplikasian cat kuku dan berbagai terapi lainnya. Manfaat Nail Care untuk Kesehatan adalah merawat kutikula, merapikan kuku, merawat kulit kering di tangan dan kaki, mengangkat sel kulit mati, mengatasi berbagai keluhan di tangan dan kaki, dan juga memberikan efek relaksasi.''',"Start Form Rp150.000,00"),
    treatments("Hair Spa and Hair Mask ", "assets/hair-spa.png",'''Hair spa and hair mask adalah perawatan rambut yang ditawarkan oleh spa kami. Hair Spa dan Hair Mask yang ditawarkan di Day Spa ini dapat menghilangkan stres di kulit kepala, pijat bahu dan menutrisi serta memperbaiki masalah-masalah yang dialami pada rambut dan kulit kepala. Manfaat Hair Spa and Hair Mask antara lain melembapkan rambut dan kulit kepala, mengurangi ketombe, mengatur produksi sebum pada kulit kepala, mengatasi penyumbatan pori-pori kulit kepala, meningkatkan sirkulasi darah pada kulit kepala, menebalkan rambut, dan memberi efek relaksasi.''',"Start Form Rp60.000,00"),
  ];
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
                      widget.treatment_name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.pngSrc),
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
                    widget.description_tratments,
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
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
                    widget.price,
                    overflow: TextOverflow.ellipsis,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_){
                              return BookingPage();
                            })
                          );
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
