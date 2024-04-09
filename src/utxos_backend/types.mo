module Types {
    public type BitcoinAddress = Text;

    public type Network = {
        #mainnet;
        #testnet;
    };

    public type Page = [Nat8];
    public type BlockHash = [Nat8];

    public type UtxosFilter = {
        MinConfirmations : Nat32;
        Page : Page;
    };

    public type GetUtxosRequest = {
        address : BitcoinAddress;
        network : Network;
        filter : ?UtxosFilter;
    };

    public type OutPoint = {
        txid : Blob;
        vout : Nat32;
    };

    public type Satoshi = Nat64;

    public type Utxo = {
        outpoint : OutPoint;
        value : Satoshi;
        height : Nat32;
    };

    public type GetUtxosResponse = {
        utxos : [Utxo];
        tip_block_hash : BlockHash;
        tip_height : Nat32;
        next_page : ?Page;
    };
};
