import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';
import 'package:finam_test_app/feature/presentation/bloc/home_bloc.dart';
import 'package:finam_test_app/feature/presentation/bloc/home_event.dart';
import 'package:finam_test_app/feature/presentation/bloc/home_state.dart';
import 'package:finam_test_app/feature/presentation/pages/error_page.dart';
import 'package:finam_test_app/feature/presentation/pages/loading_page.dart';
import 'package:finam_test_app/feature/presentation/pages/unexpected_state_page.dart';
import 'package:finam_test_app/feature/presentation/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:finam_test_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl<HomeBloc>()..add(LoadHomeDataEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeDataLoading:
              return const LoadingPage();
            case PullToRefreshEvent:
              return const LoadingPage();
            case HomeDataLoaded:
              return _HomePage((state as HomeDataLoaded).data);
            case HomeDataError:
              return const ErrorPage();
            default:
              return const UnexpectedStatePage();
          }
        },
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  final HomeDataEntity data;

  const _HomePage(this.data, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<_HomePage> createState() => _HomePageState(data);
}

class _HomePageState extends State<_HomePage> {
  var isFilterOptionsOpened = false;

  final HomeDataEntity data;

  _HomePageState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF151C29),
                Color(0xFF08153F),
              ],
            ),
          ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async { 
              context.read<HomeBloc>().add(PullToRefreshEvent());
            },  
            color: const Color(0xFF0056FF),
            backgroundColor: const Color(0xFF192740).withOpacity(0.75),
            child: ListView.builder(
              itemCount: 25,
              itemBuilder: ((context, index) {
                return PostView(data.posts[index]);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
