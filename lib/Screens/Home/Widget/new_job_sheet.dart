import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/addNewJobApplication.dart';
import 'package:intertrack/Utils/utils.dart';

class NewJobSheet extends StatelessWidget {
  final _controller = Get.put(AddNewJobApplicationController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive().smallW),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.multiply),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Save',
                  ),
                )
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Company Name",
                labelStyle: TextStyle(
                  fontSize: Responsive().largeW,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            SizedBox(height: Responsive().smallH),
            SubCategoryTitle(FontAwesomeIcons.clock, "Date Of Application"),
            ListTile(
              title: GestureDetector(
                onTap: () async {
                  await pickDate(context);
                },
                child: Obx(() {
                  return Text(
                    formatDate(
                      _controller?.startDateTime.value ?? DateTime.now(),
                    ),
                  );
                }),
              ),
              trailing: GestureDetector(
                onTap: () async {
                  await pickTime(context);
                },
                child: Obx(() {
                  return Text(
                    formatTime(
                        _controller?.startDateTime.value ?? DateTime.now()),
                  );
                }),
              ),
            ),
            Divider(),
            SizedBox(height: Responsive().smallH),
            SubCategoryTitle(FontAwesomeIcons.graduationCap, "Job Description"),
            Row(
              children: [
                Chip(label: Text('Full Time')),
                SizedBox(width: Responsive().smallW),
                Chip(label: Text('Part Time'))
              ],
            ),
            TextFormField(
              decoration: inputDecoration(labelText: 'Position'),
            ),
            SizedBox(height: Responsive().smallH),
            TextFormField(
              decoration: inputDecoration(labelText: 'Location Remote'),
            ),
            SizedBox(height: Responsive().smallH),
            SubCategoryTitle(FontAwesomeIcons.affiliatetheme, "Status"),
            CheckboxListTile(
              value: true,
              title: Text('Application Submitted'),
              onChanged: (val) {},
            ),
            TextFormField(
              decoration: inputDecoration(labelText: 'Under Review'),
            ),
          ],
        ),
      ),
    );
  }
}

class SubCategoryTitle extends StatelessWidget {
  const SubCategoryTitle(
    this.icondata,
    this.title,
  );

  final IconData icondata;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icondata),
        SizedBox(
          width: Responsive().smallW,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

Future<DateTime?> pickDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      Duration(days: 100),
    ),
  );
}

Future<TimeOfDay?> pickTime(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
}
