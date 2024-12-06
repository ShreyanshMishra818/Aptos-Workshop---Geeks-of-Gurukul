module MyModule::NFTMarketplace {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct NFT has store, key {
        creator: address,
        owner: address,
        royalty_percentage: u8,
    }

    /// Function to mint a new NFT with specified royalty percentage
    public fun mint_nft(creator: &signer, royalty_percentage: u8) {
        let nft = NFT {
            creator: signer::address_of(creator),
            owner: signer::address_of(creator),
            royalty_percentage,
        };
        // Move the NFT to the creator's account; no need to return `nft`
        move_to(creator, nft);
    }
}
