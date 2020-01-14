/**
 * @file /kobuki_dock_drive/include/kobuki_dock_drive/state.hpp
 *
 * @brief States 
 *
 * License: BSD
 *   https://raw.githubusercontent.com/kobuki-base/kobuki_core/license/LICENSE
**/
/*****************************************************************************
** Ifdefs
*****************************************************************************/
#ifndef KOBUKI_DOCK_DRIVE_STATE_HPP_
#define KOBUKI_DOCK_DRIVE_STATE_HPP_

/*****************************************************************************
** States
*****************************************************************************/
#include <iostream>

namespace kobuki {

  // indicates the ir sensor from docking station
  struct DockStationIRState {
    enum State {
      INVISIBLE=0,
      NEAR_LEFT=1,
      NEAR_CENTER=2,
      NEAR_RIGHT=4,
      FAR_CENTER=8,
      FAR_LEFT=16,
      FAR_RIGHT=32,
      NEAR = 7, // NEAR_LEFT + NEAR_CENTER + NEAR_RIGHT
      FAR = 56, // FAR_CENTER + FAR_LEFT + FAR_RIGHT
    };
  };

  // the current robot states
  struct RobotDockingState {
    enum State {
      IDLE,
      DONE,
      DOCKED_IN,
      BUMPED_DOCK,
      BUMPED,
      SCAN,
      FIND_STREAM,
      GET_STREAM,
      ALIGNED,
      ALIGNED_FAR,
      ALIGNED_NEAR,
      UNKNOWN,
      LOST
    };

  };

  /*
  struct RobotDockingState {
      enum State {
        IDLE,
        NEAR_LEFT,
        NEAR_CENTER,
        NEAR_RIGHT,
        FAR_CENTER,
        FAR_LEFT,
        FAR_RIGHT,
        IN_DOCK,
        DONE,
        ERROR,
      };
  };*/
}

#endif // KOBUKI_DOCK_DRIVE_STATE_HPP_ 
