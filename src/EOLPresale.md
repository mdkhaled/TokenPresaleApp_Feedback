[Back](../Readme.md)
# ELOPresale
## Overview

The ELOPresale contract manages a token presale with contribution tracking, whitelisting, soft cap and hard cap enforcement, refund management, liquidity lock mechanics, emergency pause, and withdrawal controls.
The contract implements reentrancy protection using OpenZeppelin's ReentrancyGuard.

## Structs
### PresaleInfo

Information about the presale configuration.

sale_token
Address of the token being sold.

payment_token
Address of the token used for payment.

price
Token sale price per unit.

softcap
Minimum required raise to consider presale successful.

hardcap
Maximum allowed raise.

start_time
Unix timestamp when presale starts.

end_time
Unix timestamp when presale ends.

min_contribution
Minimum contribution per participant.

max_contribution
Maximum contribution per participant.

### BuyerInfo

Contribution and claim data for each buyer.

amount
Total amount contributed.

tokens_allocation
Total tokens allocated to contributor.

claimed
Whether the buyer has already claimed purchased tokens.

## Events
PresaleCreated(presaleId, creator)

Emitted when a new presale is created.

presaleId — Unique presale ID.

creator — Address that created the presale.

Contributed(presaleId, buyer, amount, tokensBought)

Emitted when a user contributes to the presale.

presaleId — Presale identifier.

buyer — Buyer contributing.

amount — Contribution amount.

tokensBought — Tokens allocated.

TokensClaimed(presaleId, buyer, amount)

Emitted when a user claims purchased tokens.

presaleId — Identifier of presale.

buyer — Address of participant claiming.

amount — Number of tokens claimed.

Refunded(presaleId, buyer, amount)

Emitted when a buyer receives a refund.

presaleId — Identifier.

buyer — Address receiving refund.

amount — Amount refunded.

Finalized(presaleId)

Emitted when presale is successfully finalized.

presaleId — Identifier.

Cancelled(presaleId)

Emitted when presale owner cancels the presale.

presaleId — Identifier.

## Modifiers
onlyOwner(presaleId)

Ensures caller is the owner of the presale.

Reverts if caller is not owner.

presaleActive(presaleId)

Ensures the presale is currently active.

Requires block.timestamp to be within start and end times.

presaleEnded(presaleId)

Ensures presale time window has ended.

nonReentrant

Inherited from OpenZeppelin to prevent reentrancy attacks.

## Functions
### createPresale(info)

Creates a new presale using the provided configuration.

Parameters

info — A PresaleInfo struct with presale configuration.

Returns

presaleId — Newly created presale ID.

Requirements

Must validate caps, price, token supply, timeframe, and min/max contributions.

Must ensure the presale token is approved and supply is available.

### contribute(presaleId, amount)

Allows user to contribute to the presale.

Parameters

presaleId — ID of target presale.

amount — Amount of payment token contributed.

Effects

Allocates tokens based on price.

Updates buyer info and total raised.

Requirements

Presale must be ongoing.

Contribution must respect min/max limits.

Hardcap must not be exceeded.

### claimTokens(presaleId)

Allows buyers to claim their purchased tokens after successful presale.

Parameters

presaleId — Target presale.

Effects

Transfers allocated tokens to caller.

Marks buyer as claimed.

Requirements

Presale ended and reached softcap.

Caller must have unclaimed tokens.

### claimRefund(presaleId)

Allows buyers to claim refund if presale failed.

Parameters

presaleId — Identifier.

Effects

Returns contributed payment tokens.

Requirements

Presale ended and softcap not met.

Caller has refundable contributions.

### finalizePresale(presaleId)

Marks the presale as complete and transfers collected funds to the owner.

Parameters

presaleId — Identifier.

Effects

Transfers raised funds to presale owner.

Requirements

Softcap reached.

Presale ended.

Only presale owner can call.

### cancelPresale(presaleId)

Allows presale creator to cancel an ongoing presale.

Parameters

presaleId — Identifier.

Effects

Marks presale as cancelled.

Enables refund claims.

Requirements

Can only be called by presale owner.

Presale must not have ended.

### getBuyerInfo(presaleId, buyer)

Returns buyer contribution and allocation information.

Returns

BuyerInfo struct.

### getPresaleInfo(presaleId)

Returns all presale configuration details.

### isWhitelisted(presaleId, address)

Checks if address is whitelisted for the given presale.

### pausePresale(presaleId)

Pauses presale due to emergency.

### resumePresale(presaleId)

Resumes previously paused presale.

## Errors
PresaleNotActive()

Thrown when interacting with an inactive presale.

PresaleNotEnded()

Thrown when action requires presale to have ended first.

ContributionTooLow()

Contribution amount is below minimum.

ContributionTooHigh()

Contribution exceeds maximum allowed.

HardcapReached()

Presale already reached its hardcap.

SoftcapNotMet()

Presale ended but softcap not reached.

AlreadyClaimed()

User already claimed tokens.

NoRefundAvailable()

Caller has no refunds available.

NotPresaleOwner()

Caller is not presale owner.

## State Variables
presales

Mapping of presale ID to PresaleInfo.

buyers

Nested mapping storing buyer contributions by presale ID.

presaleOwner

Mapping from presale ID to the creator address.

totalRaised

Tracks amount raised per presale.

isPaused

Emergency pause flag per presale.

# Testing

I have given some sample tests. For <b>audit ready contracts<b>, we need to go through details tests and code coverages. Here I put so sample tests. Bellow I am giving the purpose of specific files.

## ELOPresale.t.sol
This file have some unit tests. I just wrote some samples. Not testes throughly. The idea is to test all public and external functions. All internal or private functions need to be tested via those external and public functions.

## ELOPresaleFuzz.t.sol

The stateless fuzzy test to provide random inputs.

[Back](../Readme.md)
## ELOPresaleInvariant.t.sol

The fuzzy test with state.
