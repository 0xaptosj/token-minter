#[test_only]
module minter::token_minter_utils {
    use std::option;
    use std::string;
    use aptos_framework::object::Object;

    use minter::token_minter;
    use minter::token_minter::TokenMinter;

    const COLLECTION_NAME: vector<u8> = b"TestCollection";
    const COLLECTION_DESCRIPTION: vector<u8> = b"Test collection tests";
    const COLLECTION_URI: vector<u8> = b"http://test.uri";
    const ROYALTY_NUMERATOR: u64 = 500;
    const ROYALTY_DENOMINATOR: u64 = 10000;

    public fun init_token_minter_and_collection(
        creator: &signer,
        creator_mint_only: bool,
        soulbound: bool,
    ): Object<TokenMinter> {
        let max_supply = option::none(); // Unlimited supply for unlimited collection
        let mutable_description = true;
        let mutable_royalty = true;
        let mutable_uri = true;
        let mutable_token_description = true;
        let mutable_token_name = true;
        let mutable_token_properties = true;
        let mutable_token_uri = true;
        let tokens_burnable_by_creator = true;
        let tokens_freezable_by_creator = true;

        let token_minter = token_minter::create_token_minter(
            creator,
            string::utf8(COLLECTION_DESCRIPTION),
            max_supply,
            string::utf8(COLLECTION_NAME),
            string::utf8(COLLECTION_URI),
            mutable_description,
            mutable_royalty,
            mutable_uri,
            mutable_token_description,
            mutable_token_name,
            mutable_token_properties,
            mutable_token_uri,
            tokens_burnable_by_creator,
            tokens_freezable_by_creator,
            ROYALTY_NUMERATOR,
            ROYALTY_DENOMINATOR,
            creator_mint_only,
            soulbound,
        );

        token_minter
    }
}
