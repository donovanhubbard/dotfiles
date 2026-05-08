#!/usr/bin/env zsh

ROOT_DIR=${XDG_CACHE_HOME:-$HOME/.cache}
CSCO_DIR="$ROOT_DIR/csco"
PRICE_FILE="$CSCO_DIR/price.txt"
LOG_DIR="$CSCO_DIR/logs"
LOG_FILE="$LOG_DIR/fetcher.log"
MAX_LOG_LINES=1000
RETAIN_LOG_LINES=500
URL="https://investor.cisco.com/feed/StockQuote.svc/GetFullStockQuoteList?exchange=XNAS&symbol=CSCO&pageSize=1"

if [[ ! -d "$CSCO_DIR" ]]; then
  mkdir -p "$CSCO_DIR"
fi
if [[ ! -d "$LOG_DIR" ]]; then
  mkdir -p "$LOG_DIR"
fi

print_log(){
  DATE=$(date)
  print "$DATE: $1" >> $LOG_FILE
  LOG_LINES=$(cat $LOG_FILE | wc -l | xargs)
  if (( $LOG_LINES > $MAX_LOG_LINES )); then
    LOG_CONTENTS=$(tail -n $RETAIN_LOG_LINES $LOG_FILE)
    print $LOG_CONTENTS > $LOG_FILE
  fi
}

print_log "Starting $0"

JSON=$(curl "$URL" 2>&1)

if (( $? != 0 )); then
  print_log "Failed to curl host"
  print_log "$JSON"
  print_log "Terminating program"
  return 1
fi

if [[ "$JSON" =~ "\"TradePrice\"\:([0-9]{1,4}\.[0-9]{1,2})," ]]; then
  PRICE=$(printf "%.2f" $match[1])
  print_log "Price is \$$PRICE"
  print "$PRICE" > $PRICE_FILE
else
  print_log "Couldn't find the price with regex."
  print_log "$JSON"
fi

print_log "End of program."
