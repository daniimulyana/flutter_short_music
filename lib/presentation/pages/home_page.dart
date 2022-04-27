import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_short_music/common/enum/enums.dart';
import 'package:flutter_short_music/presentation/widgets/music_list.dart';
import 'package:flutter_short_music/presentation/widgets/music_player.dart';
import 'package:flutter_short_music/presentation/widgets/music_search.dart';

import '../../common/di/get_it.dart';
import '../blocs/music_list/music_list_cubit.dart';
import '../blocs/music_player/music_player_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MusicListCubit musicListCubit;
  late MusicPlayerCubit musicPlayerCubit;

  @override
  void initState() {
    super.initState();

    musicListCubit = getItInstance<MusicListCubit>();
    musicPlayerCubit = getItInstance<MusicPlayerCubit>();
  }

  @override
  void dispose() {
    musicListCubit.close();
    musicPlayerCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => musicListCubit),
        BlocProvider(create: (context) => musicPlayerCubit),
      ],
      child: BlocListener<MusicPlayerCubit, MusicPlayerState>(
        listener: (context, state) {
          if (state.playerState == AudioPlayerState.failure) {
            showDialog(context: context, builder: (_) {
              return AlertDialog(
                title: const Text('Oops, something went wrong...'),
                content: Text(state.errorMessage),
              );
            });
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: const [
                MusicSearch(),
                Expanded(child: MusicList()),
                MusicPlayer()
              ],
            ),
          ),
        ),
      ),
      );
  }
}
