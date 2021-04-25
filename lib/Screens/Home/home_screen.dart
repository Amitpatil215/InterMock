import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/jobApplications_controller.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Screens/Home/JobApplicationWidgets/JobApplicationWidgets.dart';
import 'package:intertrack/Screens/Home/NewApplicationSheetWidgets/new_job_application_widget.dart';
import 'package:intertrack/Shared/Shared.dart';
import 'package:intertrack/Utils/utils.dart';

class HomeScreen extends StatelessWidget {
  final JobApplicationsController? _jobApplicationsController =
      Get.put(JobApplicationsController());
  final NewJobApplicationController? _newJobApplicationController =
      Get.put(NewJobApplicationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBGColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Responsive().smallW),
          child: JobApplicationsList(
            controller: _jobApplicationsController!,
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showCustomBottomModelSheet(context, NewJobSheet()).then((_) {
              _newJobApplicationController?.resetAllFieldsInSheet();
            });
          },
          label: Text('New'),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
