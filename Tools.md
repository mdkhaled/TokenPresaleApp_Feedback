# Tools
## IDE
VS Code

##
Solidity version ^0.8.30

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## versions

<b><u>foundryup</u></b> 

<b>forge</b> 1.4.4-stable (05794498bf2025-11-03T23:44:21.031788094Z)

<b>cast</b> 1.4.4-stable (05794498bf 2025-11-03T23:44:21.031788094Z)

<b>anvil</b> 1.4.4-stable (05794498bf 2025-11-03T23:44:21.031788094Z)

<b>chisel</b> 1.4.4-stable (05794498bf 2025-11-03T23:44:21.031788094Z)

## OpenZeppelin Contracts

**OpenZeppelin Contracts is a secure, community-audited, and extensible library of reusable smart contracts for Ethereum and EVM-based blockchains.**

It provides production-ready implementations of widely used standards and patterns in Solidity, enabling developers to build secure blockchain applications faster and with fewer mistakes.

OpenZeppelin Contracts includes:

- **Token Standards**  
  Implementations of ERC-20, ERC-721 (NFTs), ERC-1155, and extensions like snapshots, burnable tokens, pausable tokens, and capped supply.

- **Access Control**  
  Role-based access control (`AccessControl`) and classic ownership (`Ownable`) to manage permissions.

- **Security Modules**  
  Robust utilities such as `ReentrancyGuard`, `Pausable`, `SafeERC20`, `SafeCast`, `ECDSA`, etc.

- **Utilities & Helpers**  
  Math libraries, Counters, Strings, address validation, cryptographic helpers, and EIP-712 typed data support.

- **Governance Tools**  
  Modules for token voting, timelocks, and decentralized governance workflows.

- **Upgradeable Contract Support**  
  Full suite for proxy-based upgradeable deployments (`UUPS`, `Transparent`), `Initializable` base contracts, and storage-safe patterns.

---

## Versions

| OpenZeppelin Version | Solidity Version |
| -------------------- | ---------------- |
| 5.x.x                | ^0.8.20          |
| 4.x.x                | ^0.8.0           |
| 3.x.x                | ^0.6.x           |

Wehave used

openzeppelin-contracts tag=v5.5.0@fcbae5394ae8ad52d8e580a3477db99814b9d565

## Static analyzer

<details>
<summary>Slither</summary>
INFO:Detectors:
ELOToken.allowance(address,address).owner (src/ELOToken.sol#161) shadows:
        - Ownable.owner() (lib/openzeppelin-contracts/contracts/access/Ownable.sol#56-58) (function)
ELOToken._approve(address,address,uint256).owner (src/ELOToken.sol#324) shadows:
        - Ownable.owner() (lib/openzeppelin-contracts/contracts/access/Ownable.sol#56-58) (function)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#local-variable-shadowing
INFO:Detectors:
StorageSlot.getAddressSlot(bytes32) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#66-70) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#67-69)
StorageSlot.getBooleanSlot(bytes32) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#75-79) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#76-78)
StorageSlot.getBytes32Slot(bytes32) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#84-88) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#85-87)
StorageSlot.getUint256Slot(bytes32) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#93-97) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#94-96)
StorageSlot.getInt256Slot(bytes32) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#102-106) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#103-105)
StorageSlot.getStringSlot(bytes32) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#111-115) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#112-114)
StorageSlot.getStringSlot(string) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#120-124) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#121-123)
StorageSlot.getBytesSlot(bytes32) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#129-133) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#130-132)
StorageSlot.getBytesSlot(bytes) (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#138-142) uses assembly
        - INLINE ASM (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#139-141)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#assembly-usage
INFO:Detectors:
4 different versions of Solidity are used:
        - Version constraint ^0.8.20 is used by:
                -^0.8.20 (lib/openzeppelin-contracts/contracts/access/Ownable.sol#4)
                -^0.8.20 (lib/openzeppelin-contracts/contracts/utils/Context.sol#4)
                -^0.8.20 (lib/openzeppelin-contracts/contracts/utils/ReentrancyGuard.sol#4)
                -^0.8.20 (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#5)
        - Version constraint >=0.4.16 is used by:
                ->=0.4.16 (lib/openzeppelin-contracts/contracts/interfaces/IERC20.sol#4)
                ->=0.4.16 (lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol#4)
        - Version constraint >=0.6.2 is used by:
                ->=0.6.2 (lib/openzeppelin-contracts/contracts/token/ERC20/extensions/IERC20Metadata.sol#4)
        - Version constraint ^0.8.30 is used by:
                -^0.8.30 (src/ELOToken.sol#2)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#different-pragma-directives-are-used
INFO:Detectors:
ELOToken._burn(address,uint256) (src/ELOToken.sol#298-309) is never used and should be removed
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#dead-code
INFO:Detectors:
Version constraint ^0.8.20 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
        - VerbatimInvalidDeduplication
        - FullInlinerNonExpressionSplitArgumentEvaluationOrder
        - MissingSideEffectsOnSelectorAccess.
It is used by:
        - ^0.8.20 (lib/openzeppelin-contracts/contracts/access/Ownable.sol#4)
        - ^0.8.20 (lib/openzeppelin-contracts/contracts/utils/Context.sol#4)
        - ^0.8.20 (lib/openzeppelin-contracts/contracts/utils/ReentrancyGuard.sol#4)
        - ^0.8.20 (lib/openzeppelin-contracts/contracts/utils/StorageSlot.sol#5)
Version constraint >=0.4.16 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
        - DirtyBytesArrayToStorage
        - ABIDecodeTwoDimensionalArrayMemory
        - KeccakCaching
        - EmptyByteArrayCopy
        - DynamicArrayCleanup
        - ImplicitConstructorCallvalueCheck
        - TupleAssignmentMultiStackSlotComponents
        - MemoryArrayCreationOverflow
        - privateCanBeOverridden
        - SignedArrayStorageCopy
        - ABIEncoderV2StorageArrayWithMultiSlotElement
        - DynamicConstructorArgumentsClippedABIV2
        - UninitializedFunctionPointerInConstructor_0.4.x
        - IncorrectEventSignatureInLibraries_0.4.x
        - ExpExponentCleanup
        - NestedArrayFunctionCallDecoder
        - ZeroFunctionSelector.
It is used by:
        - >=0.4.16 (lib/openzeppelin-contracts/contracts/interfaces/IERC20.sol#4)
        - >=0.4.16 (lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol#4)
Version constraint >=0.6.2 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
        - MissingSideEffectsOnSelectorAccess
        - AbiReencodingHeadOverflowWithStaticArrayCleanup
        - DirtyBytesArrayToStorage
        - NestedCalldataArrayAbiReencodingSizeValidation
        - ABIDecodeTwoDimensionalArrayMemory
        - KeccakCaching
        - EmptyByteArrayCopy
        - DynamicArrayCleanup
        - MissingEscapingInFormatting
        - ArraySliceDynamicallyEncodedBaseType
        - ImplicitConstructorCallvalueCheck
        - TupleAssignmentMultiStackSlotComponents
        - MemoryArrayCreationOverflow.
It is used by:
        - >=0.6.2 (lib/openzeppelin-contracts/contracts/token/ERC20/extensions/IERC20Metadata.sol#4)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-versions-of-solidity
INFO:Detectors:
Variable ELOToken._creator (src/ELOToken.sol#20) is not in mixedCase
Variable ELOToken._presaleAmount (src/ELOToken.sol#25) is not in mixedCase
Variable ELOToken._stakingAmount (src/ELOToken.sol#26) is not in mixedCase
Variable ELOToken._cexReseveredAmount (src/ELOToken.sol#27) is not in mixedCase
Variable ELOToken._teamAmount (src/ELOToken.sol#28) is not in mixedCase
Variable ELOToken._rewardAmount (src/ELOToken.sol#29) is not in mixedCase
Variable ELOToken._dexAmount (src/ELOToken.sol#30) is not in mixedCase
Variable ELOToken._customerAmount (src/ELOToken.sol#31) is not in mixedCase
Variable ELOToken._airdropAmount (src/ELOToken.sol#32) is not in mixedCase
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#conformance-to-solidity-naming-conventions
INFO:Detectors:
ELOToken._mintTimeStamp (src/ELOToken.sol#22) is never used in ELOToken (src/ELOToken.sol#10-348)
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#unused-state-variable
INFO:Detectors:
ELOToken._creator (src/ELOToken.sol#20) should be constant
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#state-variables-that-could-be-declared-constant
INFO:Detectors:
ELOToken._airdropAmount (src/ELOToken.sol#32) should be immutable
ELOToken._cexReseveredAmount (src/ELOToken.sol#27) should be immutable
ELOToken._customerAmount (src/ELOToken.sol#31) should be immutable
ELOToken._decimals (src/ELOToken.sol#19) should be immutable
ELOToken._dexAmount (src/ELOToken.sol#30) should be immutable
ELOToken._mintTimeStamp (src/ELOToken.sol#22) should be immutable
ELOToken._presaleAmount (src/ELOToken.sol#25) should be immutable
ELOToken._rewardAmount (src/ELOToken.sol#29) should be immutable
ELOToken._stakingAmount (src/ELOToken.sol#26) should be immutable
ELOToken._teamAmount (src/ELOToken.sol#28) should be immutable
ELOToken.airdropAddress (src/ELOToken.sol#42) should be immutable
ELOToken.cexReservedAddress (src/ELOToken.sol#37) should be immutable
ELOToken.customerAddress (src/ELOToken.sol#41) should be immutable
ELOToken.dexAddress (src/ELOToken.sol#40) should be immutable
ELOToken.mintingFinishedPermanent (src/ELOToken.sol#16) should be immutable
ELOToken.presaleAddress (src/ELOToken.sol#35) should be immutable
ELOToken.rewardAddress (src/ELOToken.sol#39) should be immutable
ELOToken.stakingAddress (src/ELOToken.sol#36) should be immutable
ELOToken.teamAddress (src/ELOToken.sol#38) should be immutable
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#state-variables-that-could-be-declared-immutable
INFO:Slither:src/ELOToken.sol analyzed (7 contracts with 100 detectors), 46 result(s) found


