import Cycles "mo:base/ExperimentalCycles";
import Error "mo:base/Error";
import Types "types";
import Debug "mo:base/Debug";

actor {
  type IC = actor {
    bitcoin_get_utxos : ({
      address : Types.BitcoinAddress;
      network : Types.Network;
      filter : ?Types.UtxosFilter;
    }) -> async ({ result : Types.GetUtxosResponse });
  };

  let ic : IC = actor ("aaaaa-aa");

  public func btc_get_utxos(request : Types.GetUtxosRequest) : async () {
    try {
      Cycles.add(10_000_000_000);
      let result = await ic.bitcoin_get_utxos({
        address = request.address;
        network = request.network;
        filter = request.filter;
      });
      Debug.print(debug_show (result));
    } catch (err) {
      Debug.print(Error.message(err));
    };
  };
};
