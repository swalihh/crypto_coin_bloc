import 'package:bloc_project/features/watchilist/bloc/watch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchedCoins extends StatelessWidget {
  const WatchedCoins(
      {super.key,
      this.index,
      required this.coinob,
      required this.name,
      required this.symbol,
      required this.image,
      required this.rank,
      required this.price,
      required this.high_24h,
      required this.low_24,
      required this.price_change_24h,
      required this.price_change_percentage_24h});
  final name;
  final symbol;
  final image;
  final rank;
  final price;
  final high_24h;
  final low_24;
  final price_change_24h;
  final price_change_percentage_24h;
  final coinob;
  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(75, 255, 255, 255),
          borderRadius: BorderRadius.circular(7)),
      height: 130,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    rank.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(image))),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                              symbol,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22),
                            ),
                          ))
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ListTile(
                    title: Text(
                      name,
                      maxLines: 1,
                      overflow: null,
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        price.toString(),
                        maxLines: 1,
                        overflow: null,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        price_change_24h.toString(),
                        maxLines: 1,
                        overflow: null,
                        style: TextStyle(
                            color: price_change_24h < 0
                                ? Color.fromARGB(255, 255, 0, 0)
                                : Colors.green,
                            fontWeight: FontWeight.w400,
                            fontSize: 22),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                confirmSnacbar(context, index);
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                          const Text(
                            'Remove',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 46, 46),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  confirmSnacbar(BuildContext context, index) {
    showDialog(
        barrierColor: const Color.fromARGB(169, 0, 0, 0),
        context: context,
        builder: (ctx1) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 36, 35, 46),
            title: const Text(
              'Remove',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text('Are you sure to remove this coin',
                style: TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white))),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<WatchBloc>()
                        .add(WatchRemovecoimEvetnt(index: index));
                    context.read<WatchBloc>().add(WatchSucessEvent());

                    Navigator.of(context).pop();
                  },
                  child:
                      const Text('Yes', style: TextStyle(color: Colors.white)))
            ],
          );
        });
  }
}
