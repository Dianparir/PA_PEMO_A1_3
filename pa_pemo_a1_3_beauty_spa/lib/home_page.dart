import 'package:flutter/material.dart';
import 'package:pa_pemo_a1_3_beauty_spa/booking_page.dart';
import 'package:pa_pemo_a1_3_beauty_spa/detail_treatment.dart';
import 'package:pa_pemo_a1_3_beauty_spa/main.dart';


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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchOn = false; //dark and light theme
  List <treatments> _Treatmens = [
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.topCenter,
            // padding: const EdgeInsets.all(10),
            // alignment: Alignment.center,
            height: heightScreen,
            width: widthScreen,
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.45,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: _Treatmens.length,
              itemBuilder: (context, index) {
                return new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailTreatments(
                        treatment_name: _Treatmens[index].treatment_name, pngSrc: _Treatmens[index].pngSrc, description_tratments: _Treatmens[index].description_tratments, price: _Treatmens[index].price
                      )),
                    );
                  },
                  child: Hero(
                    tag: _Treatmens[index],
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            // alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  _Treatmens[index].pngSrc,
                                ),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(_Treatmens[index].treatment_name),
                          ),
                        ],
                      ),
                    )
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
