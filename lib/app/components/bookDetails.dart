import 'dart:ffi';

import 'package:e_perpustakaan/app/data/models/response_ulasan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_perpustakaan/app/data/models/response_detailsbook.dart';

class MyBookDetails extends StatelessWidget {
  const MyBookDetails(
      {super.key, required this.dataBookDetails, required this.dataUlasan});
  final DataBookDetails dataBookDetails;
  final List<DataUlasan>? dataUlasan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset("assets/bg-buku.png",width: double.infinity,fit: BoxFit.fill,),
        const SizedBox(height: 40),
        Row(
          children: [
            Container(
              height: 190,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(dataBookDetails.coverBuku.toString()),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dataBookDetails.judulBuku.toString(),
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w700)
                                .fontFamily,
                        fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 20),
                Text("Penulis : ${dataBookDetails.penulisBuku.toString()}",
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 17),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
                Text("Penerbit : ${dataBookDetails.penerbitBuku.toString()}",
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 17),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
                Text("Tahun Terbit : ${dataBookDetails.tahunTerbit.toString()}",
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 17),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
              ],
            ))
          ],
        ),
        const SizedBox(height: 40),
        Text(
          "Deskripsi",
          style: TextStyle(
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
              fontSize: 20),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Text(
          dataBookDetails.deskripsi.toString(),
          style: TextStyle(
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
              fontSize: 20),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Text(
          "Ulasan Buku",
          style: TextStyle(
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
              fontSize: 20),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        buildUlasanList()
      ]),
    );
  }

  Widget buildUlasanList() {
    final width = MediaQuery.of(Get.context!).size.width;

    return dataUlasan!.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataUlasan!.length,
            itemBuilder: (context, index) {
              DataUlasan ulasan = dataUlasan![index];
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                height: 80,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        ulasan.ulasan ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '• ${ulasan.username}' ?? '',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFE84218),
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : Container(
            width: width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF424242),
                width: 0.5,
              ),
            ),
            child: Text(
              'Belum ada ulasan buku',
              style: GoogleFonts.inriaSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          );
  }
}
