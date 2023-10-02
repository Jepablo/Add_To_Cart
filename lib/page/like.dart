import 'package:add_to_cart/Event/liked_event.dart';
import 'package:add_to_cart/bloc/liked_bloc.dart';
import 'package:add_to_cart/state/like_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'liked_tile_widget.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  void initState() {
    //adding initial event
    likeBloc.add(LikedInitialEvent());
    super.initState();
  }

  final LikeBloc likeBloc = LikeBloc();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Like Page'),),
      body: BlocConsumer<LikeBloc, LikeState>(
          bloc: likeBloc,
          listener: (context, state) {},
          //(context,state)
          listenWhen: (previous, current) => current is LikeActionState,
          buildWhen: (previous, current) => current is! LikeActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case LikeSuccessState:
                final successState = state as LikeSuccessState;
                return ListView.builder(
                    itemCount: successState.likeItems.length,
                    itemBuilder: (context, index) {
                      print(successState.likeItems.length);
                      return LikedTileWidget(
                        likeBloc: likeBloc,
                        grocerydataModel: successState.likeItems[index],);
                    });
            }
            return Container();
          }),
    );
  }
}
