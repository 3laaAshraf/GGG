import 'package:dark/Screens/home_page.dart';
import 'package:dark/Services/fetch_data_service.dart';
import 'package:dark/Services/upload_data_service.dart';
import 'package:dark/components/review_item.dart';
import 'package:dark/models/user_review.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../darkMode_cubit/darkCubit.dart';

class ReviewsPage extends StatefulWidget {
  final String type;
  final String docTitle;
  final List<dynamic> ratings;

  ReviewsPage(
      {super.key,
      required this.type,
      required this.docTitle,
      required this.ratings});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final TextEditingController reviewDataController = TextEditingController();

  var rating_ = 0.0;

  void SubmitReview() {
    UserReview dataToSubmit = UserReview(
        rating: rating_,
        reviewContent: reviewDataController.text,
        userName: FirebaseAuth.instance.currentUser!.email ?? "",
        userImage:
            "https://static.vecteezy.com/system/resources/previews/002/608/467/non_2x/mobile-application-avatar-web-button-menu-digital-flat-style-icon-free-vector.jpg");

    UploadData()
        .submitReview(
            docTitle: widget.docTitle,
            submitData: dataToSubmit,
            type: widget.type)
        .then(
      (res) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Review submitted successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

  // File? _selectedImage;

  ////// Might be used later
  // Future<void> _pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     setState(() {
  //       _selectedImage = File(image.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Reviews",
            style: TextStyle(
                color: NewsCubit.get(context).isDark
                    ? const Color(0xFFEEEEEE)
                    : const Color(0xFF115173),
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/arrow.svg",
            height: 23,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.ratings.length,
                  itemBuilder: (context, index) {
                    return ReviewItem(
                      userReview: UserReview.fromMap(widget.ratings[index]),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Enter your Review",
                        style: TextStyle(
                            color: Color(0xffffc876),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            SubmitReview();
                          },
                          child: Container(
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 5),
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                          initialRating: rating_,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 30,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color(0xffffc876),
                              ),
                          onRatingUpdate: (rating) {
                            rating_ = rating;
                          }),
                      Spacer(),
                    ],
                  ),
                  TextField(
                    controller: reviewDataController,
                    maxLines: 3,
                    style: TextStyle(
                      color: NewsCubit.get(context).isDark
                          ? const Color(0xFFEEEEEE)
                          : const Color.fromARGB(255, 2, 1, 7),
                    ),
                    decoration: InputDecoration(
                      hintText: "Write your review here...",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffffc876)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffffc876)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
