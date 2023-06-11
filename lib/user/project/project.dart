import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../api_client/api_client.dart';
import '../../utils/toasts.dart';

class UserProject extends StatefulWidget {
  const UserProject({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<UserProject> createState() => _UserProjectState();
}

class _UserProjectState extends State<UserProject> {
  late ExpandableController controller;
  late TextEditingController titleController;
  late TextEditingController departmentController;
  late TextEditingController categoryController;
  late TextEditingController budgetController;
  late TextEditingController serviceController;
  late TextEditingController deliveryTimeController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    departmentController = TextEditingController();
    categoryController = TextEditingController();
    serviceController = TextEditingController();
    budgetController = TextEditingController();
    deliveryTimeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
        ),
        title: Text('Create Project',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Balance'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [Text('Account Balance'), Text('50')],
                    )
                  ],
                ),
              ),
              /* cardDetails('Name', Icons.person_outline, nameController!),
              const SizedBox(
                height: 10,
              ), */
              cardDetails('Title of project ', Icons.edit, titleController),
              const SizedBox(
                height: 10,
              ),
              cardDetails('Department ', MdiIcons.accountGroupOutline,
                  departmentController),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Category',
                      textAlign: TextAlign.left,
                      style: ConstantTheme().defaultStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              cardDetails2('Category', categoryController),
              const SizedBox(
                height: 30,
              ),
              cardDetails2('Budget', budgetController),
              const SizedBox(
                height: 30,
              ),
              cardDetails2('Service Type', serviceController),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Delivery Time',
                      textAlign: TextAlign.left,
                      style: ConstantTheme().defaultStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child:
                        cardDetails2('Delivery Date', deliveryTimeController),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Button(
                text: 'Continue',
                onTap: () {
                  setState(() {});
                  createProject(
                          titleController.text,
                          departmentController.text,
                          categoryController.text,
                          serviceController.text,
                          budgetController.text,
                          deliveryTimeController.text,
                          widget.token)
                      .then((response) {
                    if (response is num) {
                      showSnackBar(context,
                          "Something happened. Try again later [$response]");
                    } else {
                      if (response['title'] != null &&
                          response['title'].isNotEmpty) {
                        showSuccessSnackBar(
                            context, "Project successfully created");
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pop(context);
                        });
                      } else {
                        showSnackBar(context, "Something happened. Try again.");
                      }
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardDetails(
      String first, IconData icon, TextEditingController controller) {
    return ExpansionTile(
      textColor: Colors.grey,
      title: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(first)
        ],
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlackOutlineInput(
            controller: controller,
          ),
        )
      ],
    );
  }

  Widget cardDetails2(String first, TextEditingController controller) {
    return InkWell(
      child: ExpansionTile(
        textColor: Colors.grey,
        title: Row(
          children: [Text(first)],
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlackOutlineInput(
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}

createProject(String title, String department, String category, String service,
    String budget, String deliveryTime, String token) {
  final response = ApiClient(
          authToken:
             token)
      .post('create-project', {
    "title": title,
    "department": department,
    "category": category,
    "budget": service,
    "service_type": budget,
    "delivery_date": deliveryTime,
  });
  return response;
}
