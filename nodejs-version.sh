################################################################################
# name: nodejs-version
# what: function that allows switching between NodeJS versions
# why : nothing wrong with keeping it simple...
################################################################################

function nodejs-version {
  local PROGRAM_APPNAME='nodejs-version'
  local PROGRAM_VERSION=0.0.1

  # correct # of arguments?
  if [ $# != 1 ]; then
    echo "${PROGRAM_APPNAME} ${PROGRAM_VERSION}" >&2
    echo ""                                      >&2
    echo "Usage  : ${PROGRAM_APPNAME} <version>" >&2
    echo "Example: ${PROGRAM_APPNAME} 0.8.9"     >&2
    return 1
  fi

  # local variables
  local _NODEJS_VERSION=$1
  local _NODEJS_VERSIONS=${NODEJS_VERSIONS-''}
  local _NODEJS_ROOT=${_NODEJS_VERSIONS}/${_NODEJS_VERSION}

  # bail-out if _NODEJS_VERSIONS does not exist
  if [[ ! -d ${_NODEJS_VERSIONS} ]]; then
    echo "Sorry, but ${PROGRAM_APPNAME} requires that \$NODEJS_VERSIONS is set and points to an existing directory." >&2
    return 1
  fi

  # bail-out if _NODEJS_ROOT does not exist
  if [[ ! -d $_NODEJS_ROOT ]]; then
    echo "Sorry, but ${PROGRAM_VERSION} was unable to find directory '${_NODEJS_VERSION}' under '${_NODEJS_VERSIONS}'." >&2
    return 1
  fi

  # safe to export these now!
  export NODEJS_VERSION=${_NODEJS_VERSION}
  export NODEJS_ROOT=${_NODEJS_ROOT}

  # add the "bin" path to the front (prepend) of $PATH
  export PATH="${NODEJS_ROOT}/bin:$PATH"

  # add the "man" path to the front (prepend) of $MANPATH
  export MANPATH="${NODEJS_ROOT}/share/man:$MANPATH"

  echo "SWITCHED NodeJS VERSION TO: ${NODEJS_VERSION}"
  echo "NEW NodeJS ROOT DIRECTORY : ${NODEJS_ROOT}"
}


################################################################################
# shell completion for nodejs-version
################################################################################

if [[ ! -d ${NODEJS_VERSIONS} ]]; then
  echo "Sorry, but nodejs-version requires that the environment variable \$NODEJS_VERSIONS is set in order to initialize bash completion." >&2
  return 1
fi

if [[ ! -z ${NODEJSVERSIONDISABLE_COMPLETE} ]]; then
  return 1
fi

# completion for bash
if [[ -n ${BASH_VERSION-""} ]]; then
  _nodejsversions() {
    local CURRENTWD="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -d ${NODEJS_VERSIONS%/}/${CURRENTWD} | tr -d ${NODEJS_VERSIONS%/}/ | grep -vi "${NODEJS_VERSION}\$") )
  }

  complete -o nospace -F _nodejsversions nodejs-version
  return $?
fi
