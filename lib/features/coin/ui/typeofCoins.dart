import 'package:bloc_project/features/datamodels/coinmodelclass.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Allcoins extends StatelessWidget {
  const Allcoins(
      {super.key,
      required this.coinob,
});

  final CoinModel coinob;
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
                    coinob.rank.toString(),
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
                                    image: NetworkImage(coinob.image))),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                             coinob.symbol,
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
                      coinob.name,
                      maxLines: 1,
                      overflow: null,
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        coinob.price.toString(),
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
                        coinob.price_change_percentage_24h.toString(),
                        maxLines: 1,
                        overflow: null,
                        style: TextStyle(
                            color: coinob.price_change_24h < 0
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : Colors.green,
                            fontWeight: FontWeight.w400,
                            fontSize: 22),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<HomeBloc>().add(
                                    WatchlistaddEvent(clickedCoin: coinob));
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                          const Text(
                            'Watchlist',
                            style: TextStyle(
                              color: Colors.white,
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
}
