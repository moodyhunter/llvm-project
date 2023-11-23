#pragma once

#include "Gnu.h"
#include "clang/Driver/Driver.h"
#include "llvm/Support/Compiler.h"

namespace clang {
namespace driver {
namespace toolchains {

class LLVM_LIBRARY_VISIBILITY MOS : public Generic_ELF {
public:
  MOS(const Driver &D, const llvm::Triple &Triple,
      const llvm::opt::ArgList &Args);

  virtual std::string
  getDynamicLinker(const llvm::opt::ArgList &Args) const override;
};
} // namespace toolchains
} // namespace driver
} // namespace clang
