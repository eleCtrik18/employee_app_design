import 'package:flutter/material.dart';

import '../info.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildappBar(context),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 1.0,
              width: MediaQuery.of(context).size.width * 1.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => const MobileChatScreen(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Text(
                                info[index]['name'].toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  info[index]['department'].toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black54),
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  info[index]['profilePic'].toString(),
                                ),
                                radius: 30,
                              ),
                              trailing: int.parse(info[index]['time']!) >= 5
                                  ? Column(children: [
                                      Text(
                                        info[index]['time'].toString(),
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        'Years',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ])
                                  : Column(children: [
                                      Text(
                                        info[index]['time'].toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Text(
                                        'Years',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ]),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.greenAccent, indent: 85),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildappBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {},
      ),
      actions: [
        Icon(Icons.more_vert, size: 30),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            (Text(
              'Employee',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: 5),
            Text(
              'Manage your employees',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
