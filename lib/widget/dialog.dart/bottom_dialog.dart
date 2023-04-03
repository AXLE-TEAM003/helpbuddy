import 'package:flutter/material.dart' ;


class BottomModal{
    void show(BuildContext context, Widget widget, double height) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (
          BuildContext context,
        ) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(child: widget),
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }


}
