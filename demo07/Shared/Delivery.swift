//
//  Delivery.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

enum Delivery {
  /// Deliver immediately. No retries on failure.
  case failable

  /// Deliver as soon as possible. Automatically retries on failure.
  /// All instances of the data will be transferred sequentially.
  case guaranteed

  /// High priority data like app settings. Only the most recent value is
  /// used. Any transfers of this type not yet delivered will be replaced
  /// with the new one.
  case highPriority
}
